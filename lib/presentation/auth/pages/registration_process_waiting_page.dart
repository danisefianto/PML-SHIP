import 'package:flutter/material.dart';
import '../../../core/core.dart';
import 'sign_in_page.dart';

class RegistrationProcessWaitingPage extends StatelessWidget {
  const RegistrationProcessWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SpaceHeight(150),
                const Icon(
                  Icons.schedule,
                  size: 100,
                ),
                const SpaceHeight(20),
                const Text(
                  'Registrasi akan diproses',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  'Data Anda sedang diverifikasi oleh kami',
                ),
                const SpaceHeight(30),
                const Text(
                  'Anda akan mendapatkan notifikasi melalui email',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SpaceHeight(50),
                SizedBox(
                  height: 50.0,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      'Back to sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        color: AppColors.primaryColor,
                      ),
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
