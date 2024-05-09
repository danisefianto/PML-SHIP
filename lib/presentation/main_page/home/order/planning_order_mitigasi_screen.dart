import 'package:flutter/material.dart';

import '../../../../core/styles.dart';
import '../../../widgets/select_vessel_dropdown_widget.dart';

class PlanningOrderMitigasiScreen extends StatelessWidget {
  PlanningOrderMitigasiScreen({super.key});

  TextEditingController isianController = TextEditingController();
  TextEditingController isianController1 = TextEditingController();
  TextEditingController isianController2 = TextEditingController();

  List<String> dates = List.generate(31, (index) => (index + 1).toString());
  List<String> months = List.generate(12, (index) => (index + 1).toString());
  List<String> years = List.generate(10, (index) => (2024 + index).toString());

  // List<String> routes = [
  //   "Route A",
  //   "Route B",
  //   "Route C",
  //   "Route D",
  //   // Tambahkan lebih banyak pilihan jika diperlukan
  // ];

  @override
  Widget build(BuildContext context) {
    Widget _buildDateDropdown({required String title}) {
      return DropdownButtonFormField<String>(
        onChanged: (newValue) {
          // Implement logic when dropdown value changes
        },
        items: dates.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: title,
          filled: true,
          fillColor: secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
        ),
      );
    }

    Widget _buildMonthDropdown({required String title}) {
      return DropdownButtonFormField<String>(
        onChanged: (newValue) {
          // Implement logic when dropdown value changes
        },
        items: months.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: title,
          filled: true,
          fillColor: secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
        ),
      );
    }

    Widget _buildYearDropdown({required String title}) {
      return DropdownButtonFormField<String>(
        onChanged: (newValue) {
          // Implement logic when dropdown value changes
        },
        items: years.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          hintText: title,
          filled: true,
          fillColor: secondaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4),
            ),
          ),
        ),
      );
    }

    Widget routeCard() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jakarta - Surabaya - Banjarmasin'),
            Text('Estimated shipping time: 15 days'),
            Text('Estimated price: Rp35.000.000,00'),
          ],
        ),
      );
    }

    Widget _buildContainerWithTitle(
        BuildContext context, String title, List<String> items) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButtonFormField<String>(
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            // Perform action on change of dropdown value
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0xFF4682B4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0xFF4682B4),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color(0xFF4682B4),
              ),
            ),
            hintText: "Select $title",
          ),
        ),
      );
    }

    Widget _buildShipperInfo1(BuildContext context) {
      return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Text(
              "Loading & Discharge Date",
              style: primaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget _buildIsian2(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Estimated Time of Departure (Loading Date)",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildDateDropdown(
                    title: "Tanggal",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildMonthDropdown(
                    title: "Bulan",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildYearDropdown(
                    title: "Tahun",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Estimated Time of Arrival (Discharge Date)",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _buildDateDropdown(
                    title: "Tanggal",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildMonthDropdown(
                    title: "Bulan",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildYearDropdown(
                    title: "Tahun",
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _buildShipperInfo2(BuildContext context) {
      return Container(
        width: 359,
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6),
            Text(
              "Risk Mitigation",
              style: primaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget _buildEightyTwo(BuildContext context,
        {required String routeBTaboneoselat,
        required String duration,
        required String estimasiHarga}) {
      return Container(
        width: 320,
        padding: EdgeInsets.symmetric(vertical: 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1),
            DropdownButtonFormField<String>(
              value: routeBTaboneoselat,
              onChanged: (newValue) {
                // Implement logic when dropdown value changes
              },
              items: <String>[
                "Route A: Taboneo-Selat A-Banjarmasin",
                "Route B: Example Route B", // Add more items as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: duration,
              onChanged: (newValue) {
                // Implement logic when dropdown value changes
              },
              items: <String>[
                "Estimasi Perjalanan: 15 Days",
                "Estimasi Perjalanan: 20 Days", // Add more items as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: estimasiHarga,
              onChanged: (newValue) {
                // Implement logic when dropdown value changes
              },
              items: <String>[
                "Estimasi Harga: Rp 3.500.000.000",
                "Estimasi Harga: Rp 4.000.000.000", // Add more items as needed
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }

// TODO: fix Navigator.pop
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Planning Order'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(0),
            // margin: EdgeInsets.symmetric(
            //   horizontal: defaultMargin,
            // ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Cargo',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SelectVesselDropdownWidget(
                  customMargin: defaultMargin,
                ),
                SizedBox(
                  height: 20,
                ),
                // SelectRouteDropdownWidget(
                //   customMargin: defaultMargin,
                // ),
                Text('Please select route from our recommendation'),
                routeCard(),
                SizedBox(
                  height: 10,
                ),
                routeCard(),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      // SizedBox(height: 18),
                      // // _buildIsian(context),
                      // SizedBox(height: 18),
                      // // _buildEightyTwo(
                      // //   context,
                      // //   routeBTaboneoselat:
                      // //       "Route A: Taboneo-Selat A-Banjarmasin",
                      // //   duration: "Estimasi Perjalanan: 15 Days",
                      // //   estimasiHarga: "Estimasi Harga: Rp 3.500.000.000",
                      // // ),
                      // SizedBox(height: 18),
                      // _buildShipperInfo1(context),
                      SizedBox(height: 23),
                      _buildIsian2(context),
                      SizedBox(height: 31),
                      _buildShipperInfo2(context),
                      SizedBox(height: 11),
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgImage4,
                      //   height: 129,
                      //   width: 283,
                      //   marginBottom: 10,
                      // ),
                      SizedBox(height: 12),
                      Container(
                        margin: EdgeInsets.only(left: 79, right: 69),
                        padding:
                            EdgeInsets.symmetric(horizontal: 23, vertical: 6),
                        // decoration: AppDecoration.outlinePrimary2.copyWith(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 5),
                            SizedBox(
                              width: 159,
                              child: Text(
                                "Wind Speed: 8 km/h\nweather Status: Badai Petir\nDirection Speed 5km/h\nSuhu: 29 C\n\nNote: Pilih tanggal lain",
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: FilledButton(
                          child: Text(
                            'Next',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16.0,
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/input-shipper-consignee-data');
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
