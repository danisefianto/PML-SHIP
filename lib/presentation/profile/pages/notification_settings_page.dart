import 'package:flutter/material.dart';

import '../../../core/core.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifikasi'),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 33),
                    child: Text(
                      "Update Penting",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SpaceHeight(9),
                  Container(
                    width: 230,
                    margin: const EdgeInsets.only(left: 33),
                    child: const Text(
                      "Berisi update perihal pesanan, trip dan info akun. \nJadi harus diaktifin",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SpaceHeight(10),
                  const Divider(),
                  const SpaceHeight(15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 33),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Promo dan lainnya",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SpaceHeight(8),
                              Text(
                                "Nonaktifkan notifikasi perihal promo dan rekomendasi.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
