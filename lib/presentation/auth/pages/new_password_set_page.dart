import 'package:flutter/material.dart';
import 'sign_in_page.dart';

import '../../../core/core.dart';

class NewPasswordSetPage extends StatelessWidget {
  const NewPasswordSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.task_alt,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'All done!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'Your password has been reset. You can now proceed to login to your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
