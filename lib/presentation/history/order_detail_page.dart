import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/models/request/summary_order_request_model.dart';
import '../../../data/models/response/summary_order_response_model.dart';
import '../order/bloc/summaryOrder/summary_order_bloc.dart';

class OrderDetailPage extends StatefulWidget {
  final String transactionIdMessage;

  const OrderDetailPage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
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
    // Widget selectFile() {
    //   return DottedBorder(
    //     strokeWidth: 3,
    //     dashPattern: const [6, 6],
    //     strokeCap: StrokeCap.round,
    //     borderType: BorderType.RRect,
    //     radius: const Radius.circular(10),
    //     padding: const EdgeInsets.all(8),
    //     child: InkWell(
    //       onTap: () => (
    //         // ScaffoldMessenger.of(context).showSnackBar(
    //         //   SnackBar(
    //         //     content: Text('Kode dikirim ulang'),
    //         //   ),
    //         // ),
    //       ),
    //       child: Container(
    //         height: 80,
    //         decoration: BoxDecoration(
    //           color: const Color(0xFF1C3E66),
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: const Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Icon(
    //               Icons.folder_open_rounded,
    //               color: Color(0xFFFFFFFF),
    //               size: 32,
    //             ),
    //             SizedBox(width: 16),
    //             Text(
    //               "Upload Shipping Instruction Document",
    //               style: TextStyle(color: Colors.white),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget buildSummaryOrderUI(
        SummaryOrderResponseModel summaryOrderResponseModel,
        double biayaPajak) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: double.infinity,
            //   decoration: const BoxDecoration(color: Color(0xFFB2DFDB)),
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     // crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const Padding(
            //         padding: EdgeInsets.only(right: 8.0),
            //         child: Icon(Icons.receipt),
            //       ),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Sedang diproses',
            //               style: primaryTextStyle.copyWith(
            //                   fontWeight: bold, fontSize: 16),
            //             ),
            //             Text(
            //               'Pesanan kamu sedang diproses admin dalam 1 hari kerja.',
            //               style: primaryTextStyle.copyWith(
            //                 fontWeight: regular,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
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
                              Text(summaryOrderResponseModel.data.vesselName),

                              Text(
                                '${summaryOrderResponseModel.data.portOfLoadingName} - ${summaryOrderResponseModel.data.portOfDischargeName}',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),

                              // dari planning/quotation
                              Text(
                                'ETD: ${summaryOrderResponseModel.data.dateOfLoading.toFormattedIndonesianLongDate()}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                              Text(
                                'ETA: ${summaryOrderResponseModel.data.dateOfDischarge.toFormattedIndonesianLongDate()}',
                                style: primaryTextStyle.copyWith(
                                    fontWeight: light),
                              ),
                              const Divider(),
                              Text(
                                  'Cargo Description: ${summaryOrderResponseModel.data.cargoDescription}'),
                              Text(
                                  'Cargo Weight: ${summaryOrderResponseModel.data.cargoWeight}'),
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
                            summaryOrderResponseModel.data.shipperName,
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            summaryOrderResponseModel.data.shipperAddress,
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
                            summaryOrderResponseModel.data.consigneeName,
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            summaryOrderResponseModel.data.consigneeAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Ringkasan Pembayaran',
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biaya Pengiriman'),
                      Text(
                        summaryOrderResponseModel
                            .data.shippingCost.currencyEYDFormatRp,
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biaya Penanganan'),
                      Text(
                        summaryOrderResponseModel
                            .data.handlingCost.currencyEYDFormatRp,
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biaya Parkir Pelabuhan'),
                      Text(
                        summaryOrderResponseModel
                            .data.biayaParkirPelabuhan.currencyEYDFormatRp,
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Biaya Pajak'),
                      Text(
                        biayaPajak.currencyEYDFormatRp,
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Biaya'),
                      Text(
                        ((summaryOrderResponseModel.data.shippingCost +
                                summaryOrderResponseModel.data.handlingCost +
                                summaryOrderResponseModel
                                    .data.biayaParkirPelabuhan +
                                biayaPajak))
                            .currencyEYDFormatRp,
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                        ),
                      )
                    ],
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
          title: const Text('Detail Order'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (summaryOrderResponseModel) {
                double biayaPajak = (summaryOrderResponseModel
                            .data.shippingCost +
                        summaryOrderResponseModel.data.handlingCost +
                        summaryOrderResponseModel.data.biayaParkirPelabuhan) *
                    0.1;
                return buildSummaryOrderUI(
                    summaryOrderResponseModel, biayaPajak);
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
