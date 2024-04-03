import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';

class CarapembayaranItemWidget extends StatelessWidget {
  const CarapembayaranItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(17.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.h,
            height: 33.v,
            margin: EdgeInsets.only(
                bottom: 3.v, right: 8.h), // Tambahkan margin ke kanan
            decoration: const BoxDecoration(
              color: Color(0xFF4682B4), // Warna kotak
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCloseWhiteA70033x36,
              height: 33.v,
              width: 36.h,
              marginBottom: 10,
            ),
          ),
          SizedBox(width: 8.h),
          Expanded(
            child: SizedBox(
              height: 32.v,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transfer Bank",
                    style: TextStyle(
                      color: Colors.black, // Warna teks
                      fontSize: 14, // Ukuran teks
                    ),
                  ),
                  Text(
                    "Bank AAA",
                    style: TextStyle(
                      color: Colors.black, // Warna teks
                      fontSize: 17, // Ukuran teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.h),
          Container(
            height:
                33.v, // Ubah tinggi kotak agar sama dengan yang di sebelah kiri
            width:
                36.h, // Ubah lebar kotak agar sama dengan yang di sebelah kiri
            decoration: const BoxDecoration(
              color: Color(0xFF4682B4), // Warna kotak
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCloseWhiteA70033x36,
              height: 33.v,
              width: 36.h,
              marginBottom: 10,
            ),
          ),
        ],
      ),
    );
  }
}
