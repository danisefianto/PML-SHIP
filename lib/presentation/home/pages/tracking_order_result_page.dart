import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../widgets/search_bar.dart';

class BorderRadiusStyle {
  static const BorderRadius roundedBorder5 =
      BorderRadius.all(Radius.circular(5));
  // Add more predefined border radius styles here if needed
}

// ignore: must_be_immutable
class TrackingOrderResultPage extends StatelessWidget {
  TrackingOrderResultPage({super.key});

  TextEditingController searchController = TextEditingController();
  TextEditingController iDCounterController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController priceController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track your order'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTrackingOne(context),

            const SpaceHeight(32),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: const TableBorder(
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
                          color: const Color(0xffe5e7eb),
                          child: const Text('Shipper'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: const Color(0xffe5e7eb),
                          child: const Text('Consignee'),
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('PT BUMA'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Prima Multi Mineral,PT'),
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              'JL.PAHLAWAN SERIBU RUKO GOLDEN BOULEVARD BLOK O/5-6 BUMI SERPONG DAMAI,KEL. LENGKONG GUDANG, KEC. SERPONG, KOTA TANGERANG SELATAN, BANTEN, 15311, INDONESIA'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
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

            const SpaceHeight(25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: const TableBorder(
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
                          color: const Color(0xffe5e7eb),
                          child: const Text('From'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: const Color(0xffe5e7eb),
                          child: const Text('To'),
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Tanjung Perak Port'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Banjarmasin Port'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Table(
                border: const TableBorder(
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
                          color: const Color(0xffe5e7eb),
                          child: const Text('Cargo Description'),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 32,
                          padding: const EdgeInsets.all(8.0),
                          color: const Color(0xffe5e7eb),
                          child: const Text('Cargo Weight'),
                        ),
                      ),
                    ],
                  ),
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Batu bara'),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
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
                  color: AppColors.black,
                ),
              ),
              Text(
                "Semarang, Indonesia",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeight(20),

          // Text(
          //   "Track your Order",
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color: AppColors.black,
          //   ),
          // ),
          // SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(
                  0xFF4682B4), // Mengubah warna menjadi 0xFF4682B4 (warna biru)
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your tracking number",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
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

  Widget _buildNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Button.filled(
        onPressed: () {},
        label: 'Next',
      ),
    );
    // ElevatedButton(
    //   onPressed: () {},
    //   child: const Text('Next'),
    // )
    // CustomElevatedButton(
    //   height: 19,
    //   width: 76,
    //   text: "Next",
    //   color: const Color(0xFF4682B4),
    //   buttonTextStyle: const TextStyle(
    //     color: AppColors.primaryColor,
    //     fontSize: 12,
    //   ),
    //   onPressed: () {},
    //   onTap: () {},
    //   buttonTextstyle: null,
    // ),
  }
}
