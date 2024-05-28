import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class RegistrationProcessWaitingPage extends StatelessWidget {
  const RegistrationProcessWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('Registrasi sedang diproses')),
      //   automaticallyImplyLeading: false,
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.chevron_left),
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   // ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 150,
                ),
                const Icon(
                  Icons.schedule,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Registrasi akan diproses',
                  style:
                      primaryTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                ),

                Text(
                  'Data Anda sedang diverifikasi oleh kami',
                  style: primaryTextStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Anda akan mendapatkan notifikasi melalui email',
                  style: primaryTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50), // Tambahkan jarak sekitar 50
                SizedBox(
                  height: 50.0,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sign-in');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Back to sign in',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                    ),
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
