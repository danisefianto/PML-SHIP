import 'package:flutter/material.dart';
import '../common/styles.dart';
import 'widgets/search_bar.dart';

class BorderRadiusStyle {
  static const BorderRadius roundedBorder5 =
      BorderRadius.all(Radius.circular(5));
  // Add more predefined border radius styles here if needed
}

// ignore: must_be_immutable
class TrackingTwoScreen extends StatelessWidget {
  TrackingTwoScreen({super.key});

  TextEditingController searchController = TextEditingController();
  TextEditingController iDCounterController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController priceController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track your order'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //   child: Text(
            //     "Tracking One",
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            _buildHeader(),
            _buildTrackingOne(context),
            const SizedBox(height: 32),
            // Padding(
            //   padding: const EdgeInsets.only(left: 9),
            //   child: Text(
            //     "Current Shipment:",
            //     style: primaryTextStyle,
            //   ),
            // ),
            // const SizedBox(height: 9),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Color(0xffe5e7eb),
                    style: BorderStyle.solid,
                  ),
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  // 1: FlexColumnWidth(),
                  // 2: FixedColumnWidth(64),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('Shipper'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('Consignee'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('PT BUMA'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Prima Multi Mineral,PT'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'JL.PAHLAWAN SERIBU RUKO GOLDEN BOULEVARD BLOK O/5-6 BUMI SERPONG DAMAI,KEL. LENGKONG GUDANG, KEC. SERPONG, KOTA TANGERANG SELATAN, BANTEN, 15311, INDONESIA'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'JL. RAWAGELAM I NO.9 KAWASAN INDUSTRI PULOGADUNG JAKARTA TIMUR 13930'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // _buildCargoShip(context),

            const SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Color(0xffe5e7eb),
                    style: BorderStyle.solid,
                  ),
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('From'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('To'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Tanjung Perak Port'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Banjarmasin Port'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Color(0xffe5e7eb),
                    style: BorderStyle.solid,
                  ),
                ),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('Cargo Description'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: Color(0xffe5e7eb),
                          child: Text('Cargo Weight'),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Batu bara'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('10 Metric tonnes'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 22),
            //   child: Text(
            //     "From:",
            //     style: Theme.of(context).textTheme.bodyLarge,
            //   ),
            // ),
            // const SizedBox(height: 7),
            // _buildPrice(context),
            // const SizedBox(height: 9),
            // Padding(
            //   padding: const EdgeInsets.only(left: 22),
            //   child: Text(
            //     "To:",
            //     style: Theme.of(context).textTheme.bodyLarge,
            //   ),
            // ),
            // const SizedBox(height: 13),
            // _buildPrice1(context),
            // const SizedBox(height: 100),
            _buildNext(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Location:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Text(
                "Semarang, Indonesia",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingOne(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          // Text(
          //   "Track your Order",
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          // SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(
                  0xFF4682B4), // Mengubah warna menjadi 0xFF4682B4 (warna biru)
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your tracking number",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 10),
                SearchBarWidget(
                  customHintText: 'ID 2024.211.190278',
                )
                // Row(
                //   children: [
                //     // Expanded(
                //     //   child: CustomSearchView(
                //     //     controller: searchController,
                //     //     hintText: "ID 2024.211.190278",
                //     //     contentPadding: EdgeInsets.all(10),
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCargoShip(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 9, right: 13),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // const CustomImageView(
            //   imagePath: ImageConstant.imgCargoShip30x30,
            //   height: 30,
            //   width: 30,
            //   marginBottom: 10,
            // ),
            // Text('some image'),
            Icon(Icons.directions_boat),
            const SizedBox(width: 10), // Tambahkan jarak antara gambar dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Batu Bara muatan 10 ton dengan jenis tug",
                    style: primaryTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Tracking ID 2024.211.29.1920",
                    style: primaryTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 9, right: 13),
        child: TextFormField(
          controller: priceController,
          decoration: InputDecoration(
            hintText: "Taboneo, Kalimantan 291124",
          ),
        )
        //  CustomTextFormField(
        //   controller: priceController,
        //   hintText: "Taboneo, Kalimantan 291124",
        //   alignment: Alignment.center,
        // ),
        );
  }

  Widget _buildPrice1(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 9, right: 13),
        child: TextField(
          controller: priceController1,
          decoration: InputDecoration(
            hintText: "Samarinda, Kalimantan 291124",
          ),
        )
        // CustomTextFormField(
        //   controller: priceController1,
        //   hintText: "Samarinda, Kalimantan 291124",
        //   textInputAction: TextInputAction.done,
        //   alignment: Alignment.center,
        // ),
        );
  }

  Widget _buildNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(onPressed: () {}, child: Text('Next'))
          // CustomElevatedButton(
          //   height: 19,
          //   width: 76,
          //   text: "Next",
          //   color: const Color(0xFF4682B4),
          //   buttonTextStyle: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 12,
          //   ),
          //   onPressed: () {},
          //   onTap: () {},
          //   buttonTextstyle: null,
          // ),
          ),
    );
  }
}
