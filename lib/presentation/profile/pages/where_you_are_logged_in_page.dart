import 'package:flutter/material.dart';

import '../../../core/core.dart';

class WhereYouAreLoggedIn extends StatelessWidget {
  const WhereYouAreLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Where you\'re logged in'),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeight(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Text(
                      "Laporkan jika ada yang tidak dikenal",
                    ),
                  ),
                  const SpaceHeight(16),
                  Center(
                    child: Container(
                      width: 285,
                      margin: const EdgeInsets.only(left: 3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF4682B4), // Warna garis
                            width: 2.0, // Lebar garis
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Menggunakan BorderRadius.circular untuk membuat borderRadius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Pusatkan kolom secara horizontal
                          children: [
                            SizedBox(
                              width: 113,
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Padang, Indonesia\n",
                                    ),
                                    TextSpan(
                                      text: "Aktif, Android, Samsung",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SpaceHeight(27),
                  Center(
                    child: Container(
                      width: 285,
                      margin: const EdgeInsets.only(left: 3),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF4682B4), // Warna garis
                            width: 2.0, // Lebar garis
                          ),
                          borderRadius: BorderRadius.circular(
                              10), // Menggunakan BorderRadius.circular untuk membuat borderRadius
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Pusatkan kolom secara horizontal
                          children: [
                            SizedBox(
                              width: 113,
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Padang, Indonesia\n",
                                    ),
                                    TextSpan(
                                      text: "Aktif, Android, Samsung",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
