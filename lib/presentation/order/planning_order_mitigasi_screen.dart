import 'package:flutter/material.dart';

import '../../core/styles.dart';
import '../widgets/select_vessel_dropdown_widget.dart';

class PlanningOrderMitigasiScreen extends StatefulWidget {
  const PlanningOrderMitigasiScreen({super.key});

  @override
  State<PlanningOrderMitigasiScreen> createState() => _PlanningOrderMitigasiScreenState();
}

class _PlanningOrderMitigasiScreenState extends State<PlanningOrderMitigasiScreen> {
  TextEditingController isianController = TextEditingController();

  TextEditingController isianController1 = TextEditingController();

  TextEditingController isianController2 = TextEditingController();

  List<String> dates = List.generate(31, (index) => (index + 1).toString());

  List<String> months = List.generate(12, (index) => (index + 1).toString());

  List<String> years = List.generate(10, (index) => (2024 + index).toString());

  // List<String> routes = [
  @override
  Widget build(BuildContext context) {
    Widget weatherDataInPort(
      String portName,
      String date,
    ) {
      // tipePelabuhan = ['loading', 'discharge']
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Pelabuhan $portName'),
              Text('Tgl $date'),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                '/weather_icons/id/am/cerah-am.webp',
                height: 50,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mostly Sunny'),
                  Text('Suhu: 32 C'),
                  Text('Wind speed min: 18 km/h'),
                  Text('Wind speed max: 18 km/h'),
                  Text('WInd Direction From: North'),
                ],
              ),
            ],
          ),
        ],
      );
    }

    Widget routeCard() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jakarta - Surabaya - Banjarmasin'),
            Text('Estimated shipping time: 15 days'),
            Text('Estimated price: Rp35.000.000,00'),
          ],
        ),
      );
    }








// TODO: fix Navigator.pop
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quotation'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0),
            // margin: EdgeInsets.symmetric(
            //   horizontal: defaultMargin,
            // ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Reccomendation',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                SelectVesselDropdownWidget(
                  customMargin: defaultMargin,
                ),
                const SizedBox(
                  height: 20,
                ),
                // SelectRouteDropdownWidget(
                //   customMargin: defaultMargin,
                // ),
                const Text('Please select route from our recommendation'),
                routeCard(),
                const SizedBox(
                  height: 10,
                ),
                routeCard(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      weatherDataInPort(
                        'Lamongan',
                        '2024-05-14',
                      ),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/input-shipper-consignee-data');
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16.0,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
