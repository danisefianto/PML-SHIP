import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'where_you_are_logged_in_page.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Security'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              const Text(
                "Kelola dengan mudah akunmu disini",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SpaceHeight(33),
              const Text(
                "Verifikasi dua langkah",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SpaceHeight(2),
              Row(
                children: [
                  const Flexible(
                    child: Text(
                      "Masuk ke akunmu dengan kemanan tambahan",
                    ),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: light,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        light = value;
                      });
                    },
                  ),
                ],
              ),
              const SpaceHeight(20),
              Button.filled(
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
          ),
        ),
      ),
    );
  }
}
