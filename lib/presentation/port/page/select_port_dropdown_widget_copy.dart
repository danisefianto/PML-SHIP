import 'package:flutter/material.dart';
import 'package:pml_ship/core/styles.dart';
import 'package:pml_ship/presentation/port/bloc/port/port_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc package

class TryPortDropdown extends StatefulWidget {
  final double customMargin;
  final String cargoState;
  final Function(String name, int id)?
      onPortSelected; // Callback function to pass selected port name and ID
  const TryPortDropdown({
    super.key, // Add Key? key parameter
    required this.customMargin,
    required this.cargoState,
    this.onPortSelected,
  }); // Call super constructor

  @override
  State<TryPortDropdown> createState() => _TryPortDropdownState();
}

class _TryPortDropdownState extends State<TryPortDropdown> {
  @override
  void initState() {
    super.initState();
    // Add BlocListener to listen for state changes in the PortBloc
    context.read<PortBloc>().add(const PortEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - widget.customMargin * 2;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Where is the ${widget.cargoState} port?',
            style: primaryTextStyle,
          ),
          const SizedBox(
            height: 5.0,
          ),
          BlocBuilder<PortBloc, PortState>(
            builder: (context, state) {
              return state.when(
                initial: () =>
                    Container(), // Initial state is not handled in this widget
                loading: () => const Center(
                    child:
                        CircularProgressIndicator()), // Show loading indicator while fetching ports
                error: (message) => Text('Error: $message',
                    style: const TextStyle(
                        color: Colors
                            .red)), // Show error message if fetching ports fails
                success: (ports) => DropdownMenu<Port>(
                  leadingIcon: const Icon(Icons.near_me),
                  width: width,
                  menuHeight: 350,
                  hintText: 'Select ${widget.cargoState} port',
                  textStyle: primaryTextStyle,
                  onSelected: (Port? value) {
                    // Handle port selection
                    if (value != null && widget.onPortSelected != null) {
                      widget.onPortSelected!(value.name, value.id);
                    }
                  },
                  dropdownMenuEntries: ports.data
                      .map(
                        (port) => DropdownMenuEntry<Port>(
                          value: Port(
                              id: port.id,
                              name: port.name), // Convert PortData to Port
                          label: port.name,
                          style: ButtonStyle(
                            textStyle:
                                MaterialStateProperty.all(primaryTextStyle),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Port {
  final int id;
  final String name;

  Port({
    required this.id,
    required this.name,
  });
}
