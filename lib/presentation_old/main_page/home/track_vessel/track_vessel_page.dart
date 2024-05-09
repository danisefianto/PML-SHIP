import 'package:flutter/material.dart';

class TrackVesselPage extends StatelessWidget {
  const TrackVesselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Track Vessel'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Text('Track Vessel'),
        ),
      ),
    );
  }
}
