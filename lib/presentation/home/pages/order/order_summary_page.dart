import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/cancel_order_request_model.dart';
import '../../../../data/models/response/order_detail_response_model.dart';
import '../../bloc/order/cancel_order/cancel_order_bloc.dart';
import '../../bloc/summaryOrder/summary_order_bloc.dart';
import '../main_page.dart';
import 'add_conference_page.dart';

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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.receipt),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sedang diproses',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Pesanan kamu sedang diproses admin dalam 1 hari kerja.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(20),
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
                          child: const Text(
                            'Detail pesanan',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transaction ID: ${summaryOrderResponseModel.data!.transactionId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),

                              Text(
                                '${summaryOrderResponseModel.data!.loading!.port} - ${summaryOrderResponseModel.data!.discharge!.port}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),

                              // dari planning/quotation
                              Text(
                                'Date of Loading: ${summaryOrderResponseModel.data!.loading!.date!.toFormattedIndonesianLongDate()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              Text(
                                'Date of Discharge: ${summaryOrderResponseModel.data!.discharge!.date!.toFormattedIndonesianLongDate()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const Divider(),
                              Text(
                                  'Cargo Description: ${summaryOrderResponseModel.data!.cargo!.description}'),
                              Text(
                                  'Cargo Weight: ${summaryOrderResponseModel.data!.cargo!.weight}'),

                              const Divider(),
                              Text(
                                'Estimated Cost: ${summaryOrderResponseModel.data!.payment!.shippingCost!.currencyEYDFormatRp}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
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
                          child: const Text(
                            'Shipper Info',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data!.shipper!.name}',
                            style: const TextStyle(fontWeight: FontWeight.w700),
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
                          child: const Text(
                            'Consignee Info',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data!.consignee!.name}',
                            style: const TextStyle(fontWeight: FontWeight.w700),
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
                  const SpaceHeight(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Button.filled(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddConferencePage(
                                transactionIdMessage: summaryOrderResponseModel
                                    .data!.transactionId
                                    .toString()),
                          ),
                        );
                      },
                      label: 'Lanjutkan Pesanan',
                    ),
                  ),
                  const SpaceHeight(30),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: BlocListener<CancelOrderBloc, CancelOrderState>(
                      listener: (context, state) {
                        state.maybeMap(
                          orElse: () {},
                          error: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message),
                                backgroundColor: AppColors.red,
                              ),
                            );
                          },
                          success: (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Order canceled successfully'),
                                backgroundColor: AppColors.green,
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()),
                                (route) => false);
                          },
                        );
                      },
                      child: Button.outlined(
                        onPressed: () {
                          final dataRequest = CancelOrderRequestModel(
                            canceledAt: DateTime.now(),
                          );
                          context.read<CancelOrderBloc>().add(
                                CancelOrderEvent.cancelOrder(
                                  dataRequest,
                                  widget.transactionIdMessage,
                                ),
                              );
                        },
                        label: 'Batalkan Pesanan',
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Summary Order'),
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                    (route) => false);
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
