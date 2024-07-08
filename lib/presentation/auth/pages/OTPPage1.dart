import 'package:flutter/material.dart';

class OTPPage1 extends StatelessWidget {
  const OTPPage1({super.key});

  @override
  Widget build(BuildContext context) {
    Widget textOTP(int code) {
      return SizedBox(
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
                hintStyle:
                    const TextStyle(color: Colors.black, fontSize: 20.0))),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi OTP'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "081617708604",
            ),
            const SizedBox(height: 10),
            const Text(
              "sefiantodani@gmail.com",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textOTP(9),
                  textOTP(3),
                  textOTP(2),
                  textOTP(4),
                  textOTP(1),
                  textOTP(8),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Kirim OTP'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Kirim ulang OTP'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Duration: 00:59",
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
