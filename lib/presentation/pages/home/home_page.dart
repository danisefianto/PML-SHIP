import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../../data/models/response/auth_response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  @override
  void initState() {
    AuthLocalDataSource().getAuthData().then((value) {
      setState(() {
        user = value.data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget customDataCustomer() {
      return Container(
        padding: EdgeInsets.only(top: defaultMargin),
        // Contain all of this part into one row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // First Row
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/request-order');
                    // INI
                    Navigator.pushNamed(
                      context,
                      AppRoutes.orderPort,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Order'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.riskMitigation,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.warning,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Risk Mitigation'),
                    ],
                  ),
                ),
              ],
            ),
            // Second Column
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.trackVessel,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.location_pin,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Track Vessel'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.documentList,
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Document List'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(Assets.image.imageProfileExample.path),
                  radius: 30.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: primaryTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        user?.name ?? '',
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Assets.image.ship.imageShipPatriaAndromeda1.image(height: 200),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),

          customDataCustomer(),

          // GestureDetector(
          //   onTap: () {
          //     // Navigator.pushNamed(context, '/list-document');
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             const UploadDocumentInOrderSummaryPage(),
          //       ),
          //     );
          //   },
          //   child: Column(
          //     children: [
          //       Container(
          //         width: 60.0,
          //         height: 60.0,
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Color(0xff9DB6D4),
          //         ),
          //         child: Icon(
          //           Icons.people,
          //           size: 30,
          //           color: primaryColor,
          //         ),
          //       ),
          //       const Text('Conference'),
          //     ],
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [
            Text('WhatsApp Us!'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.message),
          ],
        ),
      ),
    );
  }
}
