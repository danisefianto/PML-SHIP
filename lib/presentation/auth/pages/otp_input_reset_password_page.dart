import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import 'recover_password_page.dart';
import 'set_new_password.dart';

class OtpInputPasswordResetPage extends StatelessWidget {
  const OtpInputPasswordResetPage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget footer() {
      return Center(
        child: Text.rich(
          TextSpan(
            text: 'Did not receive the email? Check your spam folder or ',
            style: primaryTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: regular,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Try another email address',
                style: primaryTextStyle.copyWith(
                  color: Colors.blue,
                  fontSize: 12.0,
                  fontWeight: medium,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecoverPasswordPage(),
                      ),
                    );
                  },
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    // Widget textOTP(int code) {
    //   return SizedBox(
    //     height: 64.0,
    //     width: 40.0,
    //     child: TextField(
    //         textAlign: TextAlign.center,
    //         keyboardType: TextInputType.number,
    //         // controller: this.code,
    //         maxLength: 1,
    //         cursorColor: Theme.of(context).primaryColor,
    //         decoration: InputDecoration(
    //             hintText: code.toString(),
    //             counterText: '',
    //             hintStyle:
    //                 const TextStyle(color: Colors.black, fontSize: 20.0))),
    //   );
    // }

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.drafts,
                    size: 50,
                  ),
                  Text(
                    'Password recovery code',
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'We sent a 6-digit password recovery code to your email. Enter the code to procees',
                    style: primaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 30.0,
                  //     right: 30,
                  //     top: 20,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       textOTP(9),
                  //       textOTP(3),
                  //       textOTP(2),
                  //       textOTP(4),
                  //       textOTP(1),
                  //       textOTP(8),
                  //     ],
                  //   ),
                  // ),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Verification Code"),
                              content:
                                  Text('Code entered is $verificationCode'),
                            );
                          });
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'If you didn\'t receive the code, click ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: regular,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Resend code',
                            style: primaryTextStyle.copyWith(
                              color: Colors.blue,
                              fontSize: 12.0,
                              fontWeight: medium,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Kode dikirim ulang'),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: ' in 35 second',
                            style: primaryTextStyle.copyWith(
                              fontSize: 12.0,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                    child: Button.filled(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetNewPasswordPage(),
                          ),
                        );
                      },
                      label: 'Continue',
                    ),
                  ),

                  // Footer
                  footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
