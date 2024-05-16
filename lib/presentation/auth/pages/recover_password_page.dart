import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pml_ship/core/components/buttons.dart';

import '../../../core/styles.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({Key? key});
  @override
  Widget build(BuildContext context) {
    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Example: user@pml.co.id',
              style: primaryTextStyle,
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    // margin: EdgeInsets.only(top: 20.0),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image_logo.png'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Recover Password',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Enter the email address associated with your account and we\'ll send an email with instructions on how to recover your password.',
                  style: primaryTextStyle,
                  textAlign: TextAlign.justify,
                ),
                emailInput(),
                Container(
                  margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      Navigator.pushNamed(context, '/otp-input-password-reset');
                    },
                    label: 'Send',
                  ),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12.0,
                        fontWeight: regular,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: primaryTextStyle.copyWith(
                            color: Colors.blue,
                            fontSize: 12.0,
                            fontWeight: medium,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/sign-in');
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
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
