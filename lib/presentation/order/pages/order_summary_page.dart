import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';

import '../../../core/styles.dart';
import '../../../data/models/request/summary_order_request_model.dart';
import '../../../data/models/response/summary_order_response_model.dart';
import '../../main_page/main_page.dart';
import '../bloc/summaryOrder/summary_order_bloc.dart';

// TODO: fix supaya mendapat nama kapal, ETD
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
    context
        .read<SummaryOrderBloc>()
        .add(SummaryOrderEvent.getSummaryOrder(SummaryOrderRequestModel(
          transactionId: widget.transactionIdMessage,
        )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget selectFile() {
      return DottedBorder(
        strokeWidth: 3,
        dashPattern: const [6, 6],
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => (
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Kode dikirim ulang'),
            //   ),
            // ),
          ),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1C3E66),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_open_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 32,
                ),
                SizedBox(width: 16),
                Text(
                  "Upload Shipping Instruction Document",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSummaryOrderUI(
        SummaryOrderResponseModel summaryOrderResponseModel) {
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
                            'Detail pesanan ${widget.transactionIdMessage}',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Cargo Description: ${summaryOrderResponseModel.data.cargoDescription}'),
                              Text(
                                  'Cargo Weight: ${summaryOrderResponseModel.data.cargoWeight}'),

                              Text('MV Brahma DUMMY'),

                              Text(
                                '${summaryOrderResponseModel.data.portOfLoadingId} - ${summaryOrderResponseModel.data.portOfDischargeId}',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),

                              // dari planning/quotation
                              Text(
                                'ETD: ${summaryOrderResponseModel.data.dateOfLoading?.toFormattedIndonesianLongDate()}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                              Text(
                                'ETA: Selasa, 21 Mei 2024 DUMMY',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
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
                            '${summaryOrderResponseModel.data.shipperName}',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data.shipperAddress}',
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
                            '${summaryOrderResponseModel.data.consigneeName}',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${summaryOrderResponseModel.data.consigneeAddress}',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  selectFile(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Button.filled(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                      label: 'Negosiasi Pesanan',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Button.outlined(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                return buildSummaryOrderUI(summaryOrderResponseModel);
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
