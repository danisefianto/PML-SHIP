import 'package:flutter/material.dart';
import '../../../common/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Customer Data'),
                    ],
                  ),
                ),
                SizedBox(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Order Data'),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Document'),
                    ],
                  ),
                ),
                SizedBox(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Payment'),
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
                    Navigator.pushNamed(context, '/request-order');
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Order'),
                    ],
                  ),
                ),
                SizedBox(
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff9DB6D4),
                          ),
                          child: Icon(
                            Icons.warning,
                            size: 30,
                            color: primaryColor,
                          ),
                        ),
                        Text('Risk Mitigation'),
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
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.location_pin,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Track Vessel'),
                    ],
                  ),
                ),
                SizedBox(
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: Icon(
                          Icons.description,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text('Document List'),
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
                      AssetImage('assets/image_profile_example.jpg'),
                  radius: 30.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Pagi',
                        style: primaryTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Budi Susanto',
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
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/image 6.png',
            height: 200,
          )
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
        label: Row(
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
