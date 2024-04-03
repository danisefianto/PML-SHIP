import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';

class MetodePembayaranLimaWidget extends StatefulWidget {
  final String paymentMethod;
  final String bankName;
  final VoidCallback onTap;

  const MetodePembayaranLimaWidget({
    Key? key,
    required this.paymentMethod,
    required this.bankName,
    required this.onTap,
    required bool isSelected,
  }) : super(key: key);

  @override
  _MetodePembayaranLimaWidgetState createState() =>
      _MetodePembayaranLimaWidgetState();
}

class _MetodePembayaranLimaWidgetState
    extends State<MetodePembayaranLimaWidget> {
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
        padding: EdgeInsets.all(17.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 32.v,
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
                    Text(
                      widget.bankName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.h),
            Container(
              height: 33.v,
              width: 36.h,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF9DB6D4) : Color(0xFF4682B4),
                borderRadius: BorderRadius.circular(5.h),
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
