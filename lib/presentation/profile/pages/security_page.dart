import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../core/styles.dart';
import 'where_you_are_logged_in_page.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Security'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Kelola dengan mudah akunmu disini",
                  style: primaryTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 33),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Verifikasi dua langkah",
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Masuk ke akunmu dengan kemanan tambahan",
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Custom Switch'),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Riwayat Masuk",
                    style: primaryTextStyle,
                  ),
                  Button.filled(
                    width: 150,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WhereYouAreLoggedIn()),
                      );
                    },
                    label: 'Riwayat Login',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
