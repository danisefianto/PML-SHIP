import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Pelabuhan berangkat'),
                Text('Tgl berangkat'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  '/weather_icons/id/am/cerah-am.webp',
                  height: 50,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mostly Sunny'),
                    Text('Suhu: 32 C'),
                    Text('Wind speed min: 18 km/h'),
                    Text('Wind speed max: 18 km/h'),
                    Text('WInd Direction From: North'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
