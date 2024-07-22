import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class MetodePembayaranSatuWidget extends StatefulWidget {
  final String paymentMethod;
  final String bankName;
  final VoidCallback onTap;

  const MetodePembayaranSatuWidget({
    super.key,
    required this.paymentMethod,
    required this.bankName,
    required this.onTap,
    required bool isSelected,
  });

  @override
  State<MetodePembayaranSatuWidget> createState() =>
      _MetodePembayaranSatuWidgetState();
}

class _MetodePembayaranSatuWidgetState
    extends State<MetodePembayaranSatuWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.paymentMethod,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.bankName,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
            const SpaceWidth(8),
            Container(
              height: 33,
              width: 36,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF9DB6D4)
                    : const Color(0xFF4682B4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                        size: 20,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
