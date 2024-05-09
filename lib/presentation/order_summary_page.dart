import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../core/styles.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.teal.shade100),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.receipt),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sedang diproses',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 16),
                  ),
                  Text(
                    'Pesanan kamu sedang diproses admin dalam 1 hari kerja.',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget selectFile() {
      return DottedBorder(
        strokeWidth: 3,
        dashPattern: const [6, 6],
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => (
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Kode dikirim ulang'),
            //   ),
            // ),
          ),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFF1C3E66),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.folder_open_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  "Upload Shipping Instruction Document",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.amber),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Detail pesanan',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text('MV Brahma'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      'Tanjung perak- Banjarmasin',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      'ETD: Senin, 6 Mei 2024',
                      style: primaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'ETA: Selasa, 21 Mei 2024',
                      style: primaryTextStyle.copyWith(fontWeight: light),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.amber),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Shipper Info',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      'PT BUMA',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'JL.PAHLAWAN SERIBU RUKO GOLDEN BOULEVARD BLOK O/5-6 BUMI SERPONG DAMAI, KEL. LENGKONG GUDANG, KEC. SERPONG, KOTA TANGERANG SELATAN, BANTEN, 15311, INDONESIA'),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.amber),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Consignee Info',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Text(
                      'Prima Multi Mineral,PT',
                      style: primaryTextStyle.copyWith(fontWeight: bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'JL. RAWAGELAM I NO.9 KAWASAN INDUSTRI PULOGADUNG JAKARTA TIMUR 13930'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            selectFile(),
            Container(
              height: 50.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: FilledButton(
                child: Text(
                  'Negosiasi Pesanan',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16.0,
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30.0),
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Batalkan Pesanan',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Summary Order'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            header(),
            SizedBox(
              height: 20,
            ),
            content(),
          ],
        ),
      ),
    );
  }
}
