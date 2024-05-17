import 'package:flutter/material.dart';

import 'package:pml_ship/core/components/buttons.dart';

import '../../core/styles.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  // bool isselectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Security'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Riwayat Masuk",
                    style: primaryTextStyle,
                  ),
                  Button.filled(
                    width: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/where-you-are-logged-in');
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
