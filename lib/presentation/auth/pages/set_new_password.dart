import 'package:flutter/material.dart';
import 'package:pml_ship/core/components/buttons.dart';
import '../../../core/styles.dart';

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
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
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
                  color: primaryColor,
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
                        style: primaryTextStyle,
                        obscureText: true,
                        decoration: InputDecoration(
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          // labelText: 'try',
                          hintText: customLabelText,
                          hintStyle: subtitleTextStyle,
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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set a new password',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your new password must be different from the previous password you used.',
                  style: primaryTextStyle.copyWith(),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                passwordInput('Password'),
                passwordInput('Confirm password'),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Button.filled(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new-password-set');
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
