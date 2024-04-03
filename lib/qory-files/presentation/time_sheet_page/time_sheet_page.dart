import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pml_ship/theme/theme.dart';

class TimeSheetPage extends StatelessWidget {
  const TimeSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Text(
            'Time Sheet',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      );
    }

    Widget customFormField(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              margin: EdgeInsets.only(
                right: 16.0,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(),
              ),
              child: Text(
                value,
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget detailBillOfLading() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              customFormField(
                  'Bill of Lading Document Number', '124/PSS-BTL/VI/22'),
              // Phone
              customFormField('Shipper', 'Batu Ampar Jaya, PT'),
              // Email
              customFormField('Consignee', 'Dewa Sutratex, PT'),
              customFormField('Notify Address',
                  'Jl. Fatmawati No 1, Pangkalanbun, Kalimantan Tengah'),
              customFormField('Vessel', 'TB Brahma 3/BG.AlYA'),
              customFormField('Port of Loading',
                  'JETTY BUP Swangi Indah, Batulicin, Kalimantan Selatan'),
              customFormField('Port of Discharge',
                  'Pelabuhan PELINDO, Cirebon, Jawa Barat'),
              customFormField('Description', 'Coal in Bulk'),
              customFormField('Gross Weight', '7,351.319 MT'),
            ],
          ),
        ),
      );
    }

    Widget detailDocument() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Bill of Lading',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 16.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'time_sheet_doc_Batu_Ampar_Jaya_PT.pdf',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          Icon(Icons.upload),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget sectionTitle(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          text,
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22.0,
          ),
        ),
      );
    }

    Widget customNextButton() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                //navigator
              },
              style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Next',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0, color: primaryColor),
              ),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: header(),
        body: ListView(
          children: [
            sectionTitle('Time Sheet Info'),
            detailBillOfLading(),
            sectionTitle('Document'),
            detailDocument(),
            customNextButton(),
          ],
        ),
      ),
    );
  }
}
