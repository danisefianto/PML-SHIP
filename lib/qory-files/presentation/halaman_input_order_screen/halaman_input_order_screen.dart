import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/planning_order_mitigasi_screen/planning_order_mitigasi_screen.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/core/app_export.dart';

class HalamanInputOrderScreen extends StatefulWidget {
  const HalamanInputOrderScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HalamanInputOrderScreenState createState() =>
      _HalamanInputOrderScreenState();
}

class _HalamanInputOrderScreenState extends State<HalamanInputOrderScreen> {
  TextEditingController shipperAddressController = TextEditingController();
  TextEditingController consigneeNameController = TextEditingController();
  TextEditingController shipperNameController = TextEditingController();
  TextEditingController portOfLoadingController = TextEditingController();
  TextEditingController portOfDischargeController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  TextEditingController cargoTypeController = TextEditingController();
  TextEditingController cargoDescriptionController = TextEditingController();
  TextEditingController grossWeightController = TextEditingController();
  TextEditingController shippingInstructionController = TextEditingController();

  String selectedDate = '1';
  String selectedMonth = '1';
  String selectedYear = '${DateTime.now().year}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBack(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Center(
                      child: Text(
                        "Request Order",
                        style: CustomTextStyles.titleMediumBlack900.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.v),
                  _buildShipperInfo(context),
                  SizedBox(height: 12.v),
                  _buildConsigneeInfo(context),
                  SizedBox(height: 12.v),
                  _buildDeliveryInfo(context),
                  SizedBox(height: 12.v),
                  _buildCargoInfo(context),
                  SizedBox(height: 12.v),
                  _buildDocument(context),
                  SizedBox(height: 12.v),
                  _buildNext(context),
                ],
              ),
            ),
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
    return InkWell(
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
    );
  }

  Widget _buildShipperInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipper Info",
            style: CustomTextStyles.bodySmallPoppinswhiteA700),
        SizedBox(height: 4.v),
        _buildContainerWithTitle(context, "Shipper Info"),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: const Text(
            "Shipper Name",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildName(context, "Shipper Name", shipperNameController),
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: const Text(
            "Shipper Address",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildName(context, "Shipper Address", shipperAddressController),
      ],
    );
  }

  Widget _buildConsigneeInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Consignee Info",
            style: CustomTextStyles.bodySmallPoppinswhiteA700),
        SizedBox(height: 4.v),
        _buildContainerWithTitle(context, "Consignee Info"),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: const Text(
            "Consignee Name",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildName(context, "Consignee Name", consigneeNameController),
        SizedBox(height: 7.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: const Text(
            "Consignee Address",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildName(context, "Consignee Address", shipperNameController),
      ],
    );
  }

  Widget _buildDeliveryInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Delivery Info",
          style: CustomTextStyles.bodySmallPoppinswhiteA700,
        ),
        SizedBox(height: 4.v),
        _buildContainerWithTitle(context, "Delivery Info"),
        SizedBox(height: 9.v),
        _buildPortInfo(context, "Port of Loading", portOfLoadingController),
        SizedBox(height: 7.v),
        _buildPortInfo(context, "Port of Discharge", portOfDischargeController),
        SizedBox(height: 7.v),
        _buildEstimatedTimeInfo(context, "Estimated Time of Departure"),
        SizedBox(height: 7.v),
        _buildEstimatedTimeInfo(context, "Estimated Time of Arrival"),
      ],
    );
  }

  Widget _buildPortInfo(
      BuildContext context, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildIsian(context, label, controller),
      ],
    );
  }

  Widget _buildEstimatedTimeInfo(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 2.v),
        Row(
          children: [
            Flexible(
              // Wrap DropdownButtonFormField with Flexible
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 2.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.h),
                      padding: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700.withOpacity(0.67),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF4682B4)),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedDate,
                        onChanged: (newValue) {
                          setState(() {
                            selectedDate = newValue!;
                          });
                        },
                        items: List.generate(
                          31,
                          (index) => DropdownMenuItem(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString()),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.h),
            Flexible(
              // Wrap DropdownButtonFormField with Flexible
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Month',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 2.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.h),
                      padding: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700.withOpacity(0.67),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF4682B4)),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedMonth,
                        onChanged: (newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                          });
                        },
                        items: List.generate(
                          12,
                          (index) => DropdownMenuItem(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString()),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.h),
            Flexible(
              // Wrap DropdownButtonFormField with Flexible
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Year',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 2.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.h),
                      padding: EdgeInsets.symmetric(vertical: 5.v),
                      decoration: BoxDecoration(
                        color: appTheme.whiteA700.withOpacity(0.67),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF4682B4)),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedYear,
                        onChanged: (newValue) {
                          setState(() {
                            selectedYear = newValue!;
                          });
                        },
                        items: List.generate(
                          10,
                          (index) => DropdownMenuItem(
                            value: (DateTime.now().year + index).toString(),
                            child:
                                Text((DateTime.now().year + index).toString()),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCargoInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Cargo Info",
            style: CustomTextStyles.bodySmallPoppinswhiteA700),
        SizedBox(height: 4.v),
        _buildContainerWithTitle(context, "Cargo Info"),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Cargo Type",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 2.v),
              _buildIsian(context, "Cargo Type", cargoTypeController),
              SizedBox(height: 7.v),
              const Text("Description of Cargo",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 2.v),
              _buildIsian(
                  context, "Description of Cargo", cargoDescriptionController),
              SizedBox(height: 7.v),
              const Text("Gross Weight",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 2.v),
              _buildIsian(context, "Gross Weight", grossWeightController),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDocument(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Document",
            style: CustomTextStyles.bodySmallPoppinswhiteA700),
        SizedBox(height: 4.v),
        _buildContainerWithTitle(context, "Document"),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: const Text(
            "Shipping Instruction",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: 2.v),
        _buildIsian(
            context, "Shipping Instruction", shippingInstructionController),
      ],
    );
  }

  Widget _buildContainerWithTitle(BuildContext context, String title) {
    return Container(
      color: const Color(0xFF4682B4),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 1.7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: CustomTextStyles.bodySmallPoppinswhiteA700,
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }

  Widget _buildName(
      BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 19.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter $label',
          filled: true,
          fillColor: appTheme.whiteA700.withOpacity(0.67),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(15), // Membuat sudut menjadi melengkung
            borderSide: BorderSide.none, // Tidak ada border tepi
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: const Color(
                  0xFF4682B4), // Warna border ketika input tidak aktif
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: const Color(0xFF4682B4), // Warna border ketika input aktif
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIsian(
      BuildContext context, String label, TextEditingController controller,
      {Widget? suffixIcon}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.h, right: 19.h),
      child: SizedBox(
        width:
            double.infinity, // Ensure the text input fills the available width
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            filled: true,
            fillColor: appTheme.whiteA700.withOpacity(0.67),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: const Color(0xFF4682B4)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            suffixIcon: suffixIcon,
          ),
        ),
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
                  builder: (context) => PlanningOrderMitigasiScreen()),
            );
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlanningOrderMitigasiScreen()),
            );
          },
          buttonTextstyle: null,
        ),
      ),
    );
  }
}
