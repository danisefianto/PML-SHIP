import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'package:pml_ship/data/models/request/quotation_request_model.dart';
import 'package:pml_ship/presentation/order/bloc/checkQuotation/check_quotation_bloc.dart';
import 'package:pml_ship/presentation/order/pages/add_shipper_consignee_data_page.dart';

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
    super.initState();
    context.read<CheckQuotationBloc>().add(
          CheckQuotationEvent.checkQuotation(
            QuotationRequestModel(transactionId: widget.transactionIdMessage),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget weatherDataInPort(String portName, String date) {
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
                  Text('Wind Direction From: North'),
                ],
              ),
            ],
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Quotation'),
                leading: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: BlocBuilder<CheckQuotationBloc, CheckQuotationState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: (message) {
                  return Center(
                    child: Text('Error: $message',
                        style: const TextStyle(color: Colors.red)),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (routes) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 24.0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: routes.data.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // Handle item tap
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
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
                              '${routes.data[index].portOfLoadingName} - ${routes.data[index].portOfDischargeName}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi perjalanan: ${routes.data[index].estimatedDay} hari',
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
                    ),
                  );
                },
                orElse: () {
                  return const Center(child: Text('No data available'));
                },
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Button.outlined(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddShipperConsigneeDataPage(
                    transactionIdMessage: widget.transactionIdMessage,
                  ),
                ),
              );
            },
            label: 'Next',
          ),
        ),
      ),
    );
  }
}
