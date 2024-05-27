import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../core/styles.dart';

class ViewRatingPage extends StatelessWidget {
  const ViewRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Text(
            'Customer Payment Data',
            style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          ),
        ),
      );
    }

    Widget shipIdentity() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: defaultMargin),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  // Wrap the image with Expanded
                  child: Assets.image.payment.imageVisaLogo.image(
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('JKT-SBY'),
                Text('Coal 5 MT'),
                Text('2024-02-29')
              ],
            )
          ],
        ),
      );
    }

    Widget rate() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.iconStarColored.image(height: 40),
          const SizedBox(
            width: 10,
          ),
          Assets.icon.iconStarColored.image(height: 40),
          const SizedBox(
            width: 10,
          ),
          Assets.icon.iconStarColored.image(height: 40),
          const SizedBox(
            width: 10,
          ),
          Assets.icon.iconStarColored.image(height: 40),
          const SizedBox(
            width: 10,
          ),
          Assets.icon.iconStarColored.image(height: 40),
        ],
      );
    }

    Widget giveReview() {
      return Padding(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berikan ulasan untuk pesanan ini',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   width: 16.0,
                  // ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Tulis deskripsi Anda untuk pesanan ini',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget rejectOrVerify() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffff0000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Batal',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0, color: primaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
              onPressed: () {
                //navigator
              },
              style: TextButton.styleFrom(
                backgroundColor: verifyCheck,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Kirim',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0, color: primaryColor),
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: header(),
        body: ListView(
          children: [
            shipIdentity(),
            rate(),
            giveReview(),
            rejectOrVerify(),
          ],
        ),
      ),
    );
  }
}
