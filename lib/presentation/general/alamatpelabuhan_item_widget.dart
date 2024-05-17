import 'package:flutter/material.dart';
// import 'package:pml_ship/core/app_export.dart';

class AlamatPelabuhanItemWidget extends StatelessWidget {
  const AlamatPelabuhanItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF4682B4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Image.asset('assets/image_13.png'),
                const SizedBox(width: 10),
                Image.asset('assets/image_14.png')
              ],
            ),
            const SizedBox(height: 9),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }



  Widget _buildButtonRow() {
    return const Row(
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


  }

