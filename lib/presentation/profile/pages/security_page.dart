import 'package:flutter/material.dart';

import '../../../../core/core.dart';
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
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Kelola dengan mudah akunmu disini",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SpaceHeight(33),
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
                        SpaceHeight(2),
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
                  const Text(
                    "Riwayat Masuk",
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
