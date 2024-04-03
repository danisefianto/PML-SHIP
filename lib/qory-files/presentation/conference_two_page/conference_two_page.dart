import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_invoice_screen/halaman_invoice_screen.dart';
import 'package:pml_ship/presentation/halaman_navigasi_screen/halaman_navigasi_one_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class ConferenceTwoPage extends StatelessWidget {
  ConferenceTwoPage({Key? key}) : super(key: key);

  TextEditingController timeController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController PMLController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              _buildAppBarContent(context),
              const SizedBox(height: 16),
              _buildPaymentOptions(),
              SizedBox(height: 10.v),
              _buildShipperInfo(context),
              SizedBox(height: 10.v),
              _buildDateInput(context),
              SizedBox(height: 10.v),
              _buildTimeInput(context),
              SizedBox(height: 10.v),
              _buildZoom(context),
              SizedBox(height: 10.v),
              _buildHttpZoom(context),
              SizedBox(height: 304.v),
              _buildNext(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return const CustomAppBar(
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

  Widget _buildAppBarContent(BuildContext context) {
    return SizedBox(
      height: 34,
      width: 57,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: 29,
            width: 57,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                const CustomImageView(
                  imagePath: ImageConstant.imgUserGray800,
                  height: 29,
                  width: 57,
                  marginBottom: 10,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HalamanInvoiceScreen(),
                  ),
                );
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Center(
            child: Text(
              "Conference",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      height: 75,
                      color: const Color(0xFF4682B4),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Offline",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      color: const Color(0xFF9DB6D4),
                      child: const Center(
                        child: Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
          SizedBox(height: 2.v),
          Text(
            "Date",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDateInput(BuildContext context) {
    final List<String> days =
        List.generate(31, (index) => (index + 1).toString());
    final List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final List<String> years =
        List.generate(30, (index) => (2023 - index).toString());

    String selectedDay = days[0];
    String selectedMonth = months[0];
    String selectedYear = years[0];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 7.v),
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedDay = newValue;
                    }
                  },
                  items: days.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 5.h),
              Expanded(
                child: DropdownButton<String>(
                  value: selectedMonth,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedMonth = newValue;
                    }
                  },
                  items: months.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 5.h),
              Expanded(
                child: DropdownButton<String>(
                  value: selectedYear,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      selectedYear = newValue;
                    }
                  },
                  items: years.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 7.v),
          CustomTextFormField(
            controller: timeController,
            hintText: "13.00",
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }

  Widget _buildZoom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Meeting by",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 7.v),
          CustomTextFormField(
            controller: placeController,
            hintText: "Zoom",
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }

  Widget _buildHttpZoom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Link Meeting",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 7.v),
          CustomTextFormField(
            controller: placeController,
            hintText: "http.zoom/",
            textInputAction: TextInputAction.done,
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
                builder: (context) => HalamanNavigasiOneScreen(),
              ),
            );
          },
          onTap: () {},
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
