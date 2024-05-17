import 'package:flutter/material.dart';

import '../../core/styles.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifikasi'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
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
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 33),
                    child: Text(
                      "Update Penting",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    width: 230,
                    margin: const EdgeInsets.only(left: 33),
                    child: Text(
                        "Berisi update perihal pesanan, trip dan info akun. \nJadi harus diaktifin",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 33),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Promo dan lainnya",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Nonaktifkan notifikasi perihal promo dan rekomendasi.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 37,
                        width: 54,
                        margin: const EdgeInsets.only(left: 15, bottom: 2),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF9DB6D4),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Transform.scale(
                                  scale: 0.7, child: const Text('Switch')
                                  // CustomSwitch(
                                  //   alignment: Alignment.center,
                                  //   value: isSelectedSwitch,
                                  //   onChange: (value) {
                                  //     setState(() {
                                  //       isSelectedSwitch = value;
                                  //     });
                                  //   },
                                  // ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
