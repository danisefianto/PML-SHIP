import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/styles.dart';
import '../bloc/port/port_bloc.dart';

class SelectPortDropdownWidget extends StatefulWidget {
  final double customMargin;
  final String portType;
  final void Function(String name, int id)? onPortSelected;
  const SelectPortDropdownWidget({
    super.key,
    required this.customMargin,
    required this.portType,
    this.onPortSelected,
  });

  @override
  State<SelectPortDropdownWidget> createState() =>
      _SelectPortDropdownWidgetState();
}

class _SelectPortDropdownWidgetState extends State<SelectPortDropdownWidget> {
  String selectedPortName = '';
  int selectedPortId = 0;

  void _onPortSelected(Port? port) {
    if (port != null) {
      setState(() {
        selectedPortName = port.name;
        selectedPortId = port.id;
      });
      // Call the callback function to pass the selected port's ID and name
      if (widget.onPortSelected != null) {
        widget.onPortSelected!(port.name, port.id);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Add BlocListener to listen for state changes in the PortBloc
    context.read<PortBloc>().add(const PortEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width - 30 * 2;
    double width = MediaQuery.of(context).size.width - widget.customMargin * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where is the ${widget.portType} port?',
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
                hintText: 'Select ${widget.portType} port',
                textStyle: primaryTextStyle,
                onSelected: _onPortSelected,
                dropdownMenuEntries: ports.data
                    .map(
                      (port) => DropdownMenuEntry<Port>(
                        value: Port(
                            id: port.id,
                            name: port.name), // Convert PortData to Port
                        label: port.name,
                        style: ButtonStyle(
                          textStyle: WidgetStateProperty.all(primaryTextStyle),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
        // if (selectedPort != null)
        //   Text('You selected a ${selectedPort?.name}')
        // else
        //   const Text('Please select an port.'),
        const SizedBox(height: 10),
        // Text('Selected Port: $selectedPortName (ID: $selectedPortId)'),
      ],
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
