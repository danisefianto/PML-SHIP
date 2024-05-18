import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'package:pml_ship/data/models/request/quotation_request_model.dart';
import 'package:pml_ship/presentation/order/bloc/checkQuotation/check_quotation_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pml_ship/presentation/order/pages/add_shipper_consignee_data_page.dart';

import '../../../core/styles.dart';

class QuotationAndWeatherRiskMitigationPage extends StatefulWidget {
  final String transactionIdMessage;
  const QuotationAndWeatherRiskMitigationPage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<QuotationAndWeatherRiskMitigationPage> createState() =>
      _QuotationAndWeatherRiskMitigationPageState();
}

class _QuotationAndWeatherRiskMitigationPageState
    extends State<QuotationAndWeatherRiskMitigationPage> {
  @override
  void initState() {
    context
        .read<CheckQuotationBloc>()
        .add(CheckQuotationEvent.checkQuotation(QuotationRequestModel(
          transactionId: widget.transactionIdMessage,
        )));
    super.initState();
  }

  @override
  void dispose() {
    context.read<CheckQuotationBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget weatherDataInPort(
      String portName,
      String date,
    ) {
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
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
          children: [
            BlocBuilder<CheckQuotationBloc, CheckQuotationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  error: (message) {
                    // return snackbar
                    return const Text('Error');
                  },
                  orElse: () {
                    // return error
                    return const Text('Error');
                  },
                  loading: () {
                    // return circular progress indicator
                    return const Center(child: CircularProgressIndicator());
                  },
                  success: (routes) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: routes.data.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                // build another bloc
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    // add color
                                    side: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      routes.data[index].vesselName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${routes.data[index].portOfLoadingName}-${routes.data[index].portOfDischargeName}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Estimasi perjalanan: ${routes.data[index].estimatedDay}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Estimasi biaya: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(routes.data[index].estimatedCost)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Button.outlined(
                onPressed: () {
                  // Navigator.pushNamed(
                  //     context, '/input-shipper-consignee-data');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddShipperConsigneeDataPage(
                          transactionIdMessage: widget.transactionIdMessage),
                    ),
                  );
                },
                label: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
