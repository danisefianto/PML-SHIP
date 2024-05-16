import 'package:flutter/material.dart';

import '../../core/styles.dart';

class MetodePembayaranSatuWidget extends StatefulWidget {
  final String paymentMethod;
  final String bankName;
  final VoidCallback onTap;

  const MetodePembayaranSatuWidget({
    Key? key,
    required this.paymentMethod,
    required this.bankName,
    required this.onTap,
    required bool isSelected,
  }) : super(key: key);

  @override
  _MetodePembayaranSatuWidgetState createState() =>
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
        padding: EdgeInsets.all(17),
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(widget.bankName,
                        style: primaryTextStyle.copyWith(fontSize: 12.0)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 33,
              width: 36,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF9DB6D4) : Color(0xFF4682B4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
