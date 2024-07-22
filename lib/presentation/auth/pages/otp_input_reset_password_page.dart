import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../core/core.dart';
import 'recover_password_page.dart';
import 'set_new_password_page.dart';

class OtpInputPasswordResetPage extends StatelessWidget {
  const OtpInputPasswordResetPage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget footer() {
      return Center(
        child: Text.rich(
          TextSpan(
            text: 'Did not receive the email? Check your spam folder or ',
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Try another email address',
                style: const TextStyle(
                  color: AppColors.blue,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
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

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.drafts,
                    size: 50,
                  ),
                  const Text(
                    'Password recovery code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SpaceHeight(5),
                  const Text(
                    'We sent a 6-digit password recovery code to your email. Enter the code to procees',
                    textAlign: TextAlign.center,
                  ),

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
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Resend code',
                            style: const TextStyle(
                              color: AppColors.blue,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
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
                          const TextSpan(
                            text: ' in 35 second',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
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
