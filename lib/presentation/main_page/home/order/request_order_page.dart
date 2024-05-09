import 'package:flutter/material.dart';

import '../../../../core/styles.dart';
import '../../../widgets/select_date_widget.dart';
import '../../../widgets/select_port_dropdown_widget.dart';

class RequestOrderPage extends StatelessWidget {
  const RequestOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget cargoInput(String customLabelText, String customHintText) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customLabelText,
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: secondaryColor),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: customHintText,
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Request Order'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(0),
          // margin: EdgeInsets.symmetric(
          //   horizontal: defaultMargin,
          // ),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Port',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SelectPortDropdownWidget(
                  customMargin: defaultMargin,
                  cargoState: 'loading',
                ),
                SizedBox(
                  height: 20,
                ),
                SelectPortDropdownWidget(
                  customMargin: defaultMargin,
                  cargoState: 'discharge',
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Date',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SelectDateWidget(
                        labelText: 'Loading date',
                      ),
                      Text(
                        'Loading dates must be scheduled at least two week in advance.',
                        style: primaryTextStyle.copyWith(
                            color: Colors.red.shade900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SelectDateWidget(
                        labelText: 'Discharge date',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Cargo',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                cargoInput('Cargo description', 'Describe your cargo'),
                SizedBox(
                  height: 15,
                ),
                cargoInput(
                    'Gross weight', 'How many metric tonness of your cargo?'),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  margin: EdgeInsets.all(30),
                  child: FilledButton(
                    child: Text(
                      'Next',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                        color: primaryColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/plan-order', (route) => false);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
