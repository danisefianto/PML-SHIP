import 'package:flutter/material.dart';
import '../../../../common/styles.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool isTulisanTersediaVisible = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Frequently Asked Question'),
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
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Bagaimana cara melakukan order?",
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja vessel yang tersedia?",
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTulisanTersediaVisible = !isTulisanTersediaVisible;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: Text(
                                "Apa PML melayani order internasional?",
                                style: primaryTextStyle.copyWith(),
                              ),
                            ),
                          ),
                          Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  isTulisanTersediaVisible
                      ? _buildTulisanDenganGaris(
                          context,
                          tulisan:
                              "PML melayani order internasional melalui layanan pengiriman khusus dengan beberapa metode pengiriman yang tersedia.",
                        )
                      : const SizedBox(),
                  SizedBox(height: 11),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Apa saja logistik yang bisa dikirim PML?",
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan:
                          "Bagaimana cara menghubungi admin secara langsung?",
                    ),
                  ),
                  SizedBox(height: 11),
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 10),
                    child: _buildTulisanDenganGaris(
                      context,
                      tulisan: "Berapa maksimal seseorang melakukan order?",
                    ),
                  ),
                  SizedBox(height: 11),
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
                padding: EdgeInsets.only(top: 1),
                child: Text(
                  tulisan,
                  style: primaryTextStyle.copyWith(),
                ),
              ),
            ),
            Icon(Icons.expand_more),
          ],
        ),
        const Divider(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(height: 11),
      ],
    );
  }
}
