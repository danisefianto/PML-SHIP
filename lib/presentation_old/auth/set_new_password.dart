import 'package:flutter/material.dart';
import '../../common/styles.dart';

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({Key? key});
  @override
  Widget build(BuildContext context) {
    Widget passwordInput(String customLabelText) {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
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
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    SizedBox(
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

    Widget setNewPasswordButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: FilledButton(
          child: Text(
            'Set new password',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16.0,
              color: primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/new-password-set');
          },
          style: FilledButton.styleFrom(
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set a new password',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
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
                // Text(
                //     '"*Ketentuan Password\n1. Panjangnya minimal 12 karakter.\n2. Menggunakan huruf besar dan kecil, angka, dan simbol khusus.\n3. Tidak mengandung jalur keyboard yang mudah diingat.\n4. Tidak berdasarkan informasi pribadi Anda.",'),
                setNewPasswordButton(),
                SizedBox(
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
