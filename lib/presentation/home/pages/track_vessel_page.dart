import 'package:flutter/material.dart';

class TrackVesselPage extends StatelessWidget {
  const TrackVesselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Track Vessel'),
        ),
        body: const Center(
          child: Text('Track Vessel'),
        ),
      ),
    );
  }
}
