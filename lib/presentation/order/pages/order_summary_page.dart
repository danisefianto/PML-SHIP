import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'package:pml_ship/data/models/request/summary_order_request_model.dart';
import 'package:pml_ship/data/models/response/summary_order_response_model.dart';
import 'package:pml_ship/presentation/order/bloc/summaryOrder/summary_order_bloc.dart';

import '../../../core/styles.dart';

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
  DetailSummaryOrder? dataDetailSummaryOrder;
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
    Widget header() {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFFB2DFDB)),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
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
      );
    }

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
        ),
        body: ListView(
          children: [
            header(),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<SummaryOrderBloc, SummaryOrderState>(
              listener: (context, state) {
                state.maybeWhen(
                  loading: () {
                    // circular
                    return const CircularProgressIndicator();
                  },
                  orElse: () {},
                  error: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  success: (data) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data ditambahkan'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // Navigator.pushNamed(context, '/order-summary');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OrderSummaryPage(
                    //         transactionIdMessage: data.data.transactionId),
                    //   ),
                    // );
                  },
                );
              },
              builder: (context, state) {
                return Container(
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
                            Text(widget.transactionIdMessage),
                            Container(
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Detail pesanan',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text(dataDetailSummaryOrder?.cargoDescription ??
                                    ''),
                                Text(dataDetailSummaryOrder?.cargoWeight ?? ''),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text('MV Brahma DUMMY'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text(
                                'Tanjung perak- Banjarmasin DUMMY',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              // dari planning
                              child: Text(
                                'ETD: Senin, 6 Mei 2024 DUMMY',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'ETA: Selasa, 21 Mei 2024 DUMMY',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
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
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Shipper Info',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text(
                                // 'PT BUma',
                                dataDetailSummaryOrder?.shipperName ?? '',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dataDetailSummaryOrder?.shipperAddress ?? '',
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
                              decoration:
                                  const BoxDecoration(color: Colors.amber),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Consignee Info',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0),
                              child: Text(
                                dataDetailSummaryOrder?.consigneeName ?? '',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dataDetailSummaryOrder?.consigneeAddress ?? '',
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
