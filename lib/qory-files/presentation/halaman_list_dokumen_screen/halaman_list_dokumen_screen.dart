import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/beranda_page/beranda_page.dart'; // Impor halaman BillOfLadingPage
import 'package:pml_ship/presentation/bill_of_lading_page/bill_off_lading_page.dart';
import 'package:pml_ship/presentation/cargo_manifest_page/cargo_manifest_page.dart'; // Impor halaman CargoManifestPage
import 'package:pml_ship/presentation/time_sheet_page/time_sheet_page.dart'; // Impor halaman TimeSheetPage
import 'package:pml_ship/presentation/halaman_list_dokumen_screen/widgets/halaman_list_dokumen_screen_widget.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';

class HalamanListDokumenScreen extends StatelessWidget {
  const HalamanListDokumenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 33.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Daftar Dokumen",
                    style: CustomTextStyles.titleLargeBold,
                  ),
                ),
                SizedBox(height: 50.v),
                _buildHalamanlistdokumenLoadingDate(context),
                _buildNext(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BerandaPage(),
            ),
          );
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
      ),
    );
  }

  Widget _buildHalamanlistdokumenLoadingDate(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 13.v),
      itemCount: 5,
      itemBuilder: (context, index) {
        String documentName;
        switch (index) {
          case 0:
            documentName = "Shipping Instruction";
            break;
          case 1:
            documentName = "SPAL";
            break;
          case 2:
            documentName = "Bill of Lading";
            break;
          case 3:
            documentName = "Time Sheet";
            break;
          case 4:
            documentName = "Cargo Manifest";
            break;
          default:
            documentName = "Unknown Document";
            break;
        }

        return HalamanlistdokumenItemWidget(
          documentName: documentName,
          onTap: () {
            // Navigasi ke halaman yang sesuai berdasarkan nama dokumen
            if (documentName == "Bill of Lading") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BillOfLadingPage(),
                ),
              );
            } else if (documentName == "Cargo Manifest") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CargoManifestPage(), // Mengarahkan ke CargoManifestPage
                ),
              );
            } else if (documentName == "Time Sheet") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TimeSheetPage(), // Mengarahkan ke TimeSheetPage
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget _buildNext(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.v),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
              onPressed: () {},
              onTap: () {},
              buttonTextstyle: null,
            ),
          ),
        ),
      ],
    );
  }
}
