import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/core.dart';

class RiskmitigationItemwidget extends StatelessWidget {
  const RiskmitigationItemwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffDBEFEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "10 minutes ago",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.icon.weather.wave.image(height: 32),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Potensi Hujan Lebat disertai petir berpeluang terjadi di:",
                    ),
                    Text(
                      "\u2022 Perairan Riau\n\u2022 Perairan Kalimantan Barat\n\u2022 Teluk Bone\n\u2022 Perairan Agats Amamapare",
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
