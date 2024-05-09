import 'package:flutter/material.dart';
import '../../../../common/styles.dart';

class WhereYouAreLoggedIn extends StatelessWidget {
  const WhereYouAreLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Where you\'re logged in'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 11),
                    child: Text(
                      "Laporkan jika ada yang tidak dikenal",
                      style: primaryTextStyle,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 285,
                      margin: EdgeInsets.only(left: 3),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 5),
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
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Padang, Indonesia\n",
                                        style: primaryTextStyle),
                                    TextSpan(
                                        text: "Aktif, Android, Samsung",
                                        style: primaryTextStyle),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 27),
                  Center(
                    child: Container(
                      width: 285,
                      margin: EdgeInsets.only(left: 3),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 28, vertical: 5),
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
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Padang, Indonesia\n",
                                        style: primaryTextStyle),
                                    TextSpan(
                                        text: "Aktif, Android, Samsung",
                                        style: primaryTextStyle),
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
