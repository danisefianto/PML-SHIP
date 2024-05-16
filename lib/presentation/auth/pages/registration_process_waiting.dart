import 'package:flutter/material.dart';
import '../../../core/styles.dart';
import 'package:pml_ship/presentation/auth/registration_process_finished.txt'; // Import halaman prosespage2

class RegistrationProcessWaitingPage extends StatelessWidget {
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
                SizedBox(
                  height: 150,
                ),
                Icon(
                  Icons.schedule,
                  size: 100,
                ),
                SizedBox(
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Anda akan mendapatkan notifikasi melalui email',
                  style: primaryTextStyle.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50), // Tambahkan jarak sekitar 50
                Container(
                  height: 50.0,
                  // width: double.infinity,
                  // margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: FilledButton(
                    child: Text(
                      'Back to sign in',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
