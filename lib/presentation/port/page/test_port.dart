import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/presentation/port/bloc/port/port_bloc.dart';

class ShowPortPage extends StatefulWidget {
  const ShowPortPage({super.key});

  @override
  State<ShowPortPage> createState() => _ShowPortPageState();
}

class _ShowPortPageState extends State<ShowPortPage> {
  @override
  void initState() {
    context.read<PortBloc>().add(const PortEvent.getPorts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
          children: [
            BlocBuilder<PortBloc, PortState>(
              builder: (context, state) {
                return state.maybeWhen(
                  error: (message) {
                    // return snackbar
                    return const Text('Error');
                  },
                  orElse: () {
                    // return error
                    return const Text('Error');
                  },
                  loading: () {
                    // return circular progress indicator
                    return Center(child: const CircularProgressIndicator());
                  },
                  success: (ports) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: ports.data.length,
                        itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  // add color
                                  side: const BorderSide(
                                      color: Colors.grey, width: 1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ports.data[index].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
