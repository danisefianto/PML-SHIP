import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'new_password_set_page.dart';

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    Widget passwordInput(String customLabelText) {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customLabelText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.lock),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: customLabelText,
                          hintStyle: const TextStyle(
                            color: Color(0xff504F5E),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(
              30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Set a new password',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your new password must be different from the previous password you used.',
                ),
                passwordInput('Password'),
                passwordInput('Confirm password'),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPasswordSetPage(),
                        ),
                      );
                    },
                    label: 'Set new password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
