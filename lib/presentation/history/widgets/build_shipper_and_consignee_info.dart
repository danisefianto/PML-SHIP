import 'package:flutter/material.dart';

class BuildShipperAndConsigneeInfo extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  const BuildShipperAndConsigneeInfo({
    super.key,
    required this.title,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.amber),
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              address,
            ),
          ),
        ],
      ),
    );
  }
}
