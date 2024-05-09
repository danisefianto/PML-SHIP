import 'package:flutter/material.dart';

import '../../../../core/styles.dart';

class HalamanInvoiceScreen extends StatelessWidget {
  const HalamanInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 29),
                  child: _buildNomorInvoice(
                    context,
                    nomorInvoice: "Status:",
                    INVPML: "Menunggu Pembayaran",
                  ),
                ),
                SizedBox(height: 11),
                const Divider(),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 29),
                  child: _buildNomorInvoice(
                    context,
                    nomorInvoice: "Nomor Invoice",
                    INVPML: "INV/2024202/PML/31918",
                  ),
                ),
                SizedBox(height: 13),
                const Divider(),
                SizedBox(height: 12),
                _buildVessel(context),
                SizedBox(height: 12),
                const Divider(),
                SizedBox(height: 14),
                _buildRute(context),
                SizedBox(height: 10),
                const Divider(),
                SizedBox(height: 10),
                _buildEstimasiDate(context),
                SizedBox(height: 13),
                const Divider(),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 22, right: 57),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jenis Barang",
                          style: primaryTextStyle,
                        ),
                        Text(
                          "Batu Bara",
                          style: primaryTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 9),
                const Divider(),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Text(
                      "Ringkasan Pembayaran",
                      style: primaryTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 9),
                Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    right: 6,
                  ),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Harga",
                    rpCounter: "Rp 35.890.000,00",
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 6),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Biaya Pengiriman",
                    rpCounter: "Rp 23.000.000,00",
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: EdgeInsets.only(left: 22, right: 6),
                  child: _buildBiayaPengiriman(
                    context,
                    biayaPengiriman: "Biaya Penanganan",
                    rpCounter: "Rp 7.400.000,00",
                  ),
                ),
                SizedBox(height: 7),
                _buildBiayaParkirPelabuhan(context),
                SizedBox(height: 7),
                _buildBiayaPajak(context),
                SizedBox(height: 9),
                _buildBayar(context),
                SizedBox(height: 54),
                _buildNext(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'PML SHIP',
        style: primaryTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 14.0,
        ),
      ),
      leading: Icon(Icons.chevron_left),
    );
  }

  Widget _buildVessel(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 22, right: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vessel",
              style: primaryTextStyle,
            ),
            Text(
              "TB BRAHMANA 1",
              style: primaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRute(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Rute",
            style: primaryTextStyle,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text(
              "Kalimantan-Taboneo",
              style: primaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEstimasiDate(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Estimasi Date",
              style: primaryTextStyle,
            ),
            Text(
              "2-15 November 2024 (13 DAYS)",
              style: primaryTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBiayaParkirPelabuhan(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "Biaya Parkir Pelabuhan",
              style: primaryTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text(
              "Rp 3.300.000,00",
              style: primaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiayaPajak(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "Biaya Pajak",
              style: primaryTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: Text(
              "Rp 2.190.000,00",
              style: primaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBayar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1, bottom: 8),
            child: Text(
              "Bayar",
              style: primaryTextStyle,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Rp 35.890.000,00'))
        ],
      ),
    );
  }

  Widget _buildNomorInvoice(BuildContext context,
      // ignore: non_constant_identifier_names
      {required String nomorInvoice,
      // ignore: non_constant_identifier_names
      required String INVPML}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nomorInvoice,
          style: primaryTextStyle,
        ),
        Text(
          INVPML,
          style: primaryTextStyle,
        ),
      ],
    );
  }

  Widget _buildBiayaPengiriman(BuildContext context,
      {required String biayaPengiriman, required String rpCounter}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            biayaPengiriman,
            style: primaryTextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2),
          child: Text(
            rpCounter,
            style: primaryTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text('Next'),
            onPressed: () {},
          )),
    );
  }
}
