import 'package:flutter/material.dart';

import '../../../../core/styles.dart';
import '../../../auth/sign_in_page.dart';

// ignore: must_be_immutable
class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  // bool isselectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account Security'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Kelola dengan mudah akunmu disini",
                    style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 33),
                _buildSwitch(context),
                SizedBox(height: 38),
                _buildUpdateEmail(context),
                SizedBox(height: 41),
                _buildRiwayat(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verifikasi dua langkah",
                  style: primaryTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(height: 2),
                const Text(
                  "Masuk ke akunmu dengan kemanan tambahan",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          _buildSwitchWidget(context),
        ],
      ),
    );
  }

  Widget _buildSwitchWidget(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('Custom Switch'));
  }

  Widget _buildUpdateEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Mengubah crossAxisAlignment menjadi CrossAxisAlignment.start
        children: [
          Expanded(
            // Menggunakan widget Expanded untuk menyeimbangkan ruang di dalam row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Update Email",
                  style: primaryTextStyle,
                ),
                SizedBox(height: 4),
                const Text(
                  "Apabila ada email lain yang dipakai",
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          Colors.black), // Ganti dengan gaya teks yang sesuai
                ),
              ],
            ),
          ),
          SizedBox(
              width:
                  8), // Memberikan jarak horizontal antara widget Column dan CustomElevatedButton
          _buildUpdateEmailButton(context),
        ],
      ),
    );
  }

  Widget _buildUpdateEmailButton(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text('Update Email'));
  }

  Widget _buildRiwayat(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Masuk",
                  style: primaryTextStyle,
                ),
                SizedBox(height: 4),
                const Text(
                  "Lacak nama perangkat, lokasi dan tanggal",
                  style: TextStyle(
                      fontSize: 12,
                      color:
                          Colors.black), // Ganti dengan gaya teks yang sesuai
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/where-you-are-logged-in');
            },
            child: Text('Riwayat'),
          ),
        ],
      ),
    );
  }

  void onTapUpdateEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPage(),
        // UpdateEmailScreen(), // Mengarahkan ke UpdateEmailScreen
      ),
    );
  }

  void onTapRiwayat(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPage(),
        // builder: (context) => const AktivitasMasukScreen(),
      ),
    );
  }
}
