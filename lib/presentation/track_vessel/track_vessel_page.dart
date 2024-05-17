import 'package:flutter/material.dart';

class TrackVesselPage extends StatelessWidget {
  const TrackVesselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Track Vessel'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Center(
          child: Text('Track Vessel'),
        ),
      ),
    );
  }
}
