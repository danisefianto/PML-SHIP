import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/styles.dart';

class RiskmitigationItemwidget extends StatelessWidget {
  const RiskmitigationItemwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffDBEFEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "10 minutes ago",
              style: primaryTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/weather-icons/wave.png',
                height: 32,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Potensi Hujan Lebat disertai petir berpeluang terjadi di:",
                      style: primaryTextStyle,
                    ),
                    Text(
                      "\u2022 Perairan Riau\n\u2022 Perairan Kalimantan Barat\n\u2022 Teluk Bone\n\u2022 Perairan Agats Amamapare",
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
