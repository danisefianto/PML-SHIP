import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/auth/pages/sign_in_page.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';

class NewPasswordSetPage extends StatelessWidget {
  const NewPasswordSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.task_alt,
                      size: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'All done!',
                      style: primaryTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Your password has been reset. You can now proceed to login to your account',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    label: 'Go to Log In',
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
