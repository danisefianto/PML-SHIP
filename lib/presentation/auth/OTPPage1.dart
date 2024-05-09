import 'package:flutter/material.dart';
import '../../core/styles.dart';

class OTPPage1 extends StatelessWidget {
  const OTPPage1({super.key});

  @override
  Widget build(BuildContext context) {
    Widget TextOTP(int code) {
      return Container(
        height: 64.0,
        width: 56.0,
        child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            // controller: this.code,
            maxLength: 1,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
                hintText: code.toString(),
                counterText: '',
                hintStyle: TextStyle(color: Colors.black, fontSize: 20.0))),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi OTP'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "081617708604",
              style: primaryTextStyle,
            ),
            SizedBox(height: 10),
            Text(
              "sefiantodani@gmail.com",
              style: primaryTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextOTP(9),
                  TextOTP(3),
                  TextOTP(2),
                  TextOTP(4),
                  TextOTP(1),
                  TextOTP(8),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Kirim OTP'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Kirim ulang OTP'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Duration: 00:59",
              style: primaryTextStyle,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
