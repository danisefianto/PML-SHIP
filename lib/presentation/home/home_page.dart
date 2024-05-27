import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../core/styles.dart';
import '../../data/datasource/auth_local_datasource.dart';
import '../../data/models/response/auth_response_model.dart';
import '../order/pages/order_port_page.dart';

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
    Widget customDataAdmin() {
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
                    Navigator.pushNamed(context, '/customer-data');
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
                          Icons.person,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Customer Data'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/order-data');
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
                      const Text('Order Data'),
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
                    Navigator.pushNamed(context, '/document-data');
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
                      const Text('Document'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/payment-data');
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
                          Icons.account_balance_wallet,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      const Text('Payment'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const OrderPortPage();
                        },
                      ),
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
                    Navigator.pushNamed(context, '/request-order');
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/risk-mitigation');
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
                ),
              ],
            ),
            // Second Column
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/track-vessel');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const TestDropDown(),
                    //   ),
                    // );
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
                    Navigator.pushNamed(context, '/list-document');
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
          Assets.image.ship.imageShipPatriaAndromeda1.image(),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),

          // customDataAdmin(),
          customDataCustomer(),
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
