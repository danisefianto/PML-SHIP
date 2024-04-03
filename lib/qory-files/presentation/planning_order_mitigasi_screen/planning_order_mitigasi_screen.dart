import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/proses_halaman_screen/proses_halaman_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class PlanningOrderMitigasiScreen extends StatelessWidget {
  PlanningOrderMitigasiScreen({Key? key}) : super(key: key);

  TextEditingController isianController = TextEditingController();
  TextEditingController isianController1 = TextEditingController();
  TextEditingController isianController2 = TextEditingController();

  List<String> dates = List.generate(31, (index) => (index + 1).toString());
  List<String> months = List.generate(12, (index) => (index + 1).toString());
  List<String> years = List.generate(10, (index) => (2024 + index).toString());

  List<String> vessels = [
    "Vessel A",
    "Vessel B",
    "Vessel C",
    "Vessel D",
    // Tambahkan lebih banyak pilihan jika diperlukan
  ];

  List<String> routes = [
    "Route A",
    "Route B",
    "Route C",
    "Route D",
    // Tambahkan lebih banyak pilihan jika diperlukan
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppBar(context),
              _buildBack(context),
              SizedBox(height: 6.v),
              Padding(
                padding: EdgeInsets.only(bottom: 10.v),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Planning Order",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.v),
                    child: Column(
                      children: [
                        _buildShipperInfo(context),
                        SizedBox(height: 18.v),
                        _buildIsian(context),
                        SizedBox(height: 18.v),
                        _buildEightyTwo(
                          context,
                          routeBTaboneoselat:
                              "Route A: Taboneo-Selat A-Banjarmasin",
                          duration: "Estimasi Perjalanan: 15 Days",
                          estimasiHarga: "Estimasi Harga: Rp 3.500.000.000",
                        ),
                        SizedBox(height: 18.v),
                        _buildShipperInfo1(context),
                        SizedBox(height: 23.v),
                        _buildIsian2(context),
                        SizedBox(height: 31.v),
                        _buildShipperInfo2(context),
                        SizedBox(height: 11.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage4,
                          height: 129.v,
                          width: 283.h,
                          marginBottom: 10,
                        ),
                        SizedBox(height: 12.v),
                        Container(
                          margin: EdgeInsets.only(left: 79.h, right: 69.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 23.h, vertical: 6.v),
                          decoration: AppDecoration.outlinePrimary2.copyWith(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 5.v),
                              SizedBox(
                                width: 159.h,
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
                        SizedBox(height: 32.v),
                        _buildNext(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 39,
      leadingWidth: 53,
      leading: AppbarLeadingImage(
        imagePath: 'assets/images/img_9_3_29x53.png',
        marginTop: 5,
        marginBottom: 5,
        marginLeft: 6,
        alignment: Alignment.center,
        height: 29,
      ),
      title: AppbarTitle(
        text: "PML SHIP",
        margin: EdgeInsets.only(left: 6),
        alignment: Alignment.center,
        marginLeft: 0,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4682B4),
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: 'assets/images/img_contrast.png',
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          alignment: Alignment.center,
        ),
      ],
      styleType: Style.bgFill,
      marginLeft: 0,
    );
  }

  Widget _buildBack(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF4682B4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShipperInfo(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 2.v),
      decoration: AppDecoration.fillPrimary1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.v),
          const Text(
            "Recomendation",
            style: CustomTextStyles.bodySmallPoppinswhiteA700,
          ),
        ],
      ),
    );
  }

  Widget _buildIsian(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextWithTitle("Vessel Recommendation"),
        const SizedBox(height: 10),
        _buildContainerWithTitle(
            context, "Vessel Recommendation", vessels), // Pass vessels list
        const SizedBox(height: 10),
        _buildTextWithTitle("Route Recommendation"),
        const SizedBox(height: 10),
        _buildContainerWithTitle(
            context, "Route Recommendation", routes), // Pass routes list
      ],
    );
  }

  Widget _buildTextWithTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildContainerWithTitle(
      BuildContext context, String title, List<String> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
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
          fillColor: appTheme.whiteA700.withOpacity(0.67),
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
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.fillPrimary1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          const Text(
            "Loading & Discharge Date",
            style: CustomTextStyles.bodySmallPoppinswhiteA700,
          ),
        ],
      ),
    );
  }

  Widget _buildIsian2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.h),
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
      width: 359.h,
      padding: EdgeInsets.symmetric(horizontal: 19.h),
      decoration: AppDecoration.fillPrimary1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          const Text(
            "Risk Mitigation",
            style: CustomTextStyles.bodySmallPoppinswhiteA700,
          ),
        ],
      ),
    );
  }

  Widget _buildNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.center,
        child: CustomElevatedButton(
          height: 19,
          width: 76,
          text: "Next",
          color: const Color(0xFF4682B4),
          buttonTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProsesHalamanScreen()),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }

  Widget _buildEightyTwo(BuildContext context,
      {required String routeBTaboneoselat,
      required String duration,
      required String estimasiHarga}) {
    return Container(
      width: 320.h,
      padding: EdgeInsets.symmetric(vertical: 1.v),
      decoration: AppDecoration.outlinePrimary2.copyWith(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
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
          SizedBox(height: 8.v),
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
          SizedBox(height: 8.v),
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
        fillColor: appTheme.whiteA700.withOpacity(0.67),
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
        fillColor: appTheme.whiteA700.withOpacity(0.67),
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
        fillColor: appTheme.whiteA700.withOpacity(0.67),
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
}
