import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pml_ship/core/components/buttons.dart';

import '../../../core/styles.dart';

class OtpInputPasswordResetPage extends StatelessWidget {
  const OtpInputPasswordResetPage({Key? key});
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
                    Navigator.pushNamed(context, '/recover-password');
                  },
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget TextOTP(int code) {
      return Container(
        height: 64.0,
        width: 40.0,
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

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.chevron_left),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'We sent a 6-digit password recovery code to your email. Enter the code to procees',
                    style: primaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30,
                      top: 20,
                    ),
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
                  SizedBox(
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
                                  SnackBar(
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
                    margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                    child: Button.filled(
                      onPressed: () {
                        Navigator.pushNamed(context, '/set-new-password');
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
