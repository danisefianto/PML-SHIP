import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'otp_input_reset_password_page.dart';
import 'sign_in_page.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(
          top: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeight(12),
            CustomTextField(
              controller: emailController,
              label: 'Enter your email',
              hintText: 'Your Email Address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(
                Icons.email,
                color: AppColors.black,
              ),
            ),
            const SpaceHeight(5),
            const Text(
              'Example: user@pml.co.id',
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30.0,
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
                        image: AssetImage(Assets
                            .image.imageAppLogoTransparentBackground.path),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Recover Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Text(
                  'Enter the email address associated with your account and we\'ll send an email with instructions on how to recover your password.',
                  textAlign: TextAlign.justify,
                ),
                emailInput(),
                Container(
                  margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OtpInputPasswordResetPage(),
                        ),
                      );
                    },
                    label: 'Send',
                  ),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: const TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                        ),
                      ],
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
