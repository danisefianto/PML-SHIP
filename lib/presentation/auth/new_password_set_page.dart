import 'package:flutter/material.dart';

import '../../core/styles.dart';

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
                SizedBox(
                  height: 200,
                ),
                Column(
                  children: [
                    Container(
                      child: Icon(
                        Icons.task_alt,
                        size: 50,
                      ),
                    ),
                    SizedBox(
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
                  height: 50.0,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: FilledButton(
                    child: Text(
                      'Go to Log In',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
