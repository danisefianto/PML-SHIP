import 'package:flutter/material.dart';
// import 'package:pml_ship/core/app_export.dart';

class AlamatPelabuhanItemWidget extends StatelessWidget {
  const AlamatPelabuhanItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF4682B4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Image.asset('assets/image_13.png'),
                SizedBox(width: 10),
                Image.asset('assets/image_14.png')
              ],
            ),
            SizedBox(height: 9),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String imagePath,
  ) {
    return SizedBox(
      width: 204,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomImageView(
          //   imagePath: imagePath,
          //   height: 107.v,
          //   marginBottom: 10,
          //   alignment: Alignment.centerRight,
          // ),
          SizedBox(height: 9),
        ],
      ),
    );
  }

  Widget _buildRow(String imagePath, String text, Color color) {
    return Row(
      children: [
        // CustomImageView(
        //   imagePath: imagePath,
        //   height: 20,
        //   width: 20,
        //   marginBottom: 10,
        // ),
        SizedBox(width: 5.0),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow() {
    return Row(
      children: [
        Text('Bongkar Muat, Gudang'),
        // _buildButton(
        //   ImageConstant.imgPrinterMaintenance,
        //   "Bongkar Muat, Gudang",
        //   Colors.grey[300]!,
        //   fontSize: 8,
        //   textColor: Colors.black,
        // ),
        SizedBox(width: 10.0),
        Text('Rp 1000,000/Container, Rp. 50,000/hari'),
        // _buildButton(
        //   ImageConstant.imgTagWindow,
        //   "Rp 1000,000/Container, Rp. 50,000/hari",
        //   Colors.grey[400]!,
        //   fontSize: 8,
        //   textColor: Colors.black,
        // ),
        SizedBox(width: 10.0),
        Text('Senin - Jumat: 08.00 - 17.00 WIB'),
        // _buildButton(
        //   ImageConstant.imgTimeMachine,
        //   "Senin - Jumat: 08.00 - 17.00 WIB",
        //   Colors.grey[500]!,
        //   fontSize: 8,
        //   textColor: Colors.black,
        // ),
      ],
    );
  }

  Widget _buildButton(String iconPath, String text, Color color,
      {double fontSize = 12, Color textColor = Colors.black}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 14,
            height: 14,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
