import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 124.0, //Didapat dari Figma
        titleSpacing:
            0, //Untuk menghilangkan padding dari leading (leading = biasanya berupa tombol back)
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/image_profile_example.jpg'),
                radius: 30.0,
              ),
              SizedBox(
                width: 16,
              ),
              // Expanded(
              //   child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Budi Susanto',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'budisusanto@gmail.com',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'PT Anugrah Lautan Luas',
                    style: subtitleTextStyle.copyWith(
                        fontWeight: regular, fontSize: 16),
                  ),
                  Text(
                    '21.089.397.0-035.000',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              // ),
            ],
          ),
        ),
      );
    }

    Widget signOutButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: FilledButton(
          child: Text(
            'Logout',
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16.0,
            ),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          },
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xffff0000),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: primaryTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 13.0,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return
          // Expanded(
          //   child:
          Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Currency Rate',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            Text(
              '1 Dollar = Rp16.241,00',
              style: primaryTextStyle.copyWith(
                  fontSize: 16.0, fontWeight: semiBold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            GestureDetector(
              child: menuItem('Edit Personal Profile'),
              onTap: () =>
                  Navigator.pushNamed(context, '/edit-personal-profile'),
            ),
            GestureDetector(
              child: menuItem('Edit Company Profile'),
              onTap: () =>
                  Navigator.pushNamed(context, '/edit-company-profile'),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Settings',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/security'),
                child: menuItem('Security')),
            GestureDetector(
              child: menuItem('Notification Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/notification-settings');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            menuItem('Your Orders'),
            GestureDetector(
              child: menuItem('Alamat Pelabuhan'),
              onTap: () => Navigator.pushNamed(context, '/port-location'),
            ),
            GestureDetector(
              child: menuItem('How to Pay?'),
              onTap: () => Navigator.pushNamed(context, '/how-to-pay'),
            ),
            GestureDetector(
              child: menuItem('Help'),
              onTap: () => Navigator.pushNamed(context, '/faq'),
            ),
            GestureDetector(
              child: menuItem('Contact Us'),
              onTap: () => Navigator.pushNamed(context, '/contact-us'),
            ),
            SizedBox(
              height: 30.0,
            ),
            signOutButton(),
          ],
        ),
        // ),
      );
    }

    return ListView(
      children: [
        header(),
        content(),
      ],
    );
  }
}
