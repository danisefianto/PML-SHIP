import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../../data/models/response/order_detail_response_model.dart';
import '../../bloc/summaryOrder/summary_order_bloc.dart';

class OrderSummaryPage extends StatefulWidget {
  final String transactionIdMessage;

  const OrderSummaryPage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  void initState() {
    context.read<SummaryOrderBloc>().add(SummaryOrderEvent.getSummaryOrder(
          widget.transactionIdMessage,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSummaryOrderUI(
        OrderDetailResponseModel summaryOrderResponseModel) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFB2DFDB)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.receipt),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sedang diproses',
                          style: primaryTextStyle.copyWith(
                              fontWeight: bold, fontSize: 16),
                        ),
                        Text(
                          'Pesanan kamu sedang diproses admin dalam 1 hari kerja.',
                          style: primaryTextStyle.copyWith(
                            fontWeight: regular,
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
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.amber),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Detail pesanan',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transaction ID: ${summaryOrderResponseModel.data!.transactionId}',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),

                              Text(
                                '${summaryOrderResponseModel.data!.loading!.port} - ${summaryOrderResponseModel.data!.discharge!.port}',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),

                              // dari planning/quotation
                              Text(
                                'Date of Loading: ${summaryOrderResponseModel.data!.loading!.date!.toFormattedIndonesianLongDate()}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                              Text(
                                'Date of Discharge: ${summaryOrderResponseModel.data!.discharge!.date!.toFormattedIndonesianLongDate()}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                              const Divider(),
                              Text(
                                  'Cargo Description: ${summaryOrderResponseModel.data!.cargo!.description}'),
                              Text(
                                  'Cargo Weight: ${summaryOrderResponseModel.data!.cargo!.weight}'),

                              const Divider(),
                              Text(
                                'Estimated Cost: ${summaryOrderResponseModel.data!.payment!.shippingCost!.currencyEYDFormatRp}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: bold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.amber),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Shipper Info',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Text(
                            // 'PT BUma',
                            '${summaryOrderResponseModel.data!.shipper!.name}',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data!.shipper!.address}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.amber),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Consignee Info',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data!.consignee!.name}',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data!.consignee!.address}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // selectFile(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Button.filled(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.addConference,
                          arguments:
                              summaryOrderResponseModel.data!.transactionId,
                        );
                      },
                      label: 'Lanjutkan Pesanan',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Button.outlined(
                      onPressed: () {
                        // TODO: Add cancel order function and AlertDialog

                        Navigator.pushNamed(
                          context,
                          AppRoutes.signIn,
                        );
                      },
                      label: 'Batalkan Pesanan',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Summary Order'),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (context) => const MainPage()),
                //     (route) => false);
              },
            ),
          ],
        ),
        body: BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (summaryOrderResponseModel) {
                return buildSummaryOrderUI(
                  summaryOrderResponseModel,
                );
              },
              error: (message) {
                return Center(child: Text('Error: $message'));
              },
            );
          },
        ),
      ),
    );
  }
}
