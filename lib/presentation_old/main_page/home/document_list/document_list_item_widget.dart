import 'package:flutter/material.dart';
import '../../../../common/styles.dart';

class DocumentListPageWidget extends StatelessWidget {
  final String documentName;
  final VoidCallback? onTap; // Ubah tipe data menjadi VoidCallback?

  const DocumentListPageWidget({
    super.key,
    required this.documentName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color boxColor;

    // Menentukan warna kotak berdasarkan jenis dokumen
    switch (documentName) {
      case "SPAL":
        boxColor = const Color(0xFF6A60AC);
        break;
      case "Bill of Lading":
        boxColor = const Color(0xFF9FB9ED);
        break;
      case "Cargo Manifest":
        boxColor = const Color(0xFF9747FF);
        break;
      case "TimeSheet":
        boxColor = const Color(0xFF4682B4);
        break;
      default:
        // Jika nama dokumen tidak cocok, gunakan warna default
        boxColor = const Color(0xFF4682B4);
    }

    return GestureDetector(
      onTap: onTap, // Gunakan onTap yang diterima dari constructor
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        decoration: BoxDecoration(
          color: boxColor, // Mengatur warna kotak
          borderRadius: BorderRadius.circular(5), // Atur sudut border
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // CustomImageView(
            //   imagePath: ImageConstant.imgFile,
            //   height: 20.v,
            //   width: 16.h,
            //   marginBottom: 10,
            //   margin: EdgeInsets.only(top: 1.v),
            // ),
            SizedBox(width: 15),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    documentName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white, // Warna teks diubah menjadi putih
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Positioned(
                  //   right: 0,
                  //   child: CustomImageView(
                  //     imagePath: ImageConstant.imgDownloadWhiteA700,
                  //     height: 18.adaptSize,
                  //     width: 18.adaptSize,
                  //     marginBottom: 10,
                  //     margin: EdgeInsets.only(top: 1.v),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
