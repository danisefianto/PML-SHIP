import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool isTulisanTersediaVisible = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Frequently Asked Question'),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceHeight(18),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Bagaimana cara melakukan order?",
                    ),
                  ),
                  const SpaceHeight(11),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja vessel yang tersedia?",
                    ),
                  ),
                  const SpaceHeight(11),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTulisanTersediaVisible = !isTulisanTersediaVisible;
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: Text(
                                "Apa PML melayani order internasional?",
                              ),
                            ),
                          ),
                          Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ),
                  const SpaceHeight(11),
                  isTulisanTersediaVisible
                      ? _buildTulisanDenganGaris(
                          context,
                          tulisan:
                              "PML melayani order internasional melalui layanan pengiriman khusus dengan beberapa metode pengiriman yang tersedia.",
                        )
                      : const SizedBox(),
                  const SpaceHeight(11),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja logistik yang bisa dikirim PML?",
                    ),
                  ),
                  const SpaceHeight(11),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan:
                          "Bagaimana cara menghubungi admin secara langsung?",
                    ),
                  ),
                  const SpaceHeight(11),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Berapa maksimal seseorang melakukan order?",
                    ),
                  ),
                  const SpaceHeight(11),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTulisanDenganGaris(BuildContext context,
      {required String tulisan}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  tulisan,
                ),
              ),
            ),
            const Icon(Icons.expand_more),
          ],
        ),
        const Divider(
          height: 1,
          color: AppColors.black,
        ),
        const SpaceHeight(11),
      ],
    );
  }
}
