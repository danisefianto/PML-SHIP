import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../../data/models/response/summary_order_response_model.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../bloc/summaryOrder/summary_order_bloc.dart';
import '../../bloc/upload_document/upload_document_bloc.dart';

class OrderDetailPage extends StatefulWidget {
  final String transactionIdMessage;

  const OrderDetailPage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

// TODO:  Bloclistener on tombol upload, circular loading, snackbar success, hilangkan file picker setelah upload
// TODO: Fix _isUploadSuccessful

class _OrderDetailPageState extends State<OrderDetailPage> {
  bool _isUploadSuccessful = false;

  File? selectedFile; // Variable to store the selected file
  @override
  void initState() {
    context.read<SummaryOrderBloc>().add(SummaryOrderEvent.getSummaryOrder(
          widget.transactionIdMessage,
        ));
    super.initState();
  }

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        selectedFile = File(pickedFile.files.single.path!);
        _isUploadSuccessful = true; // File successfully picked
      } else {
        selectedFile = null;
        _isUploadSuccessful = false; // No file picked
      }
    });
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
          onTap: () => (_pickFile()
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
      SummaryOrderResponseModel summaryOrderResponseModel,
      double biayaPajak,
    ) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
                    child: Icon(Icons.cloud_upload),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload dokumen Shipping Instruction',
                          style: primaryTextStyle.copyWith(
                              fontWeight: bold, fontSize: 16),
                        ),
                        Text(
                          'Max input ${summaryOrderResponseModel.data.negotiationApprovedAt?.add(const Duration(days: 2)).toIso8601String()}.',
                          style: primaryTextStyle.copyWith(
                              fontWeight: regular, color: Colors.red),
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
                                'Vessel ID: ${summaryOrderResponseModel.data.vesselId}',
                                style:
                                    primaryTextStyle.copyWith(fontWeight: bold),
                              ),

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
                  // const Divider(),
                  // Text(
                  //   'Ringkasan Pembayaran',
                  //   style: primaryTextStyle.copyWith(
                  //     fontWeight: bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Biaya Pengiriman'),
                  //     Text(
                  //       summaryOrderResponseModel
                  //           .data.shippingCost.currencyEYDFormatRp,
                  //       style: primaryTextStyle.copyWith(
                  //         fontWeight: bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Biaya Penanganan'),
                  //     Text(
                  //       summaryOrderResponseModel
                  //           .data.handlingCost.currencyEYDFormatRp,
                  //       style: primaryTextStyle.copyWith(
                  //         fontWeight: bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Biaya Parkir Pelabuhan'),
                  //     Text(
                  //       summaryOrderResponseModel
                  //           .data.biayaParkirPelabuhan.currencyEYDFormatRp,
                  //       style: primaryTextStyle.copyWith(
                  //         fontWeight: bold,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Biaya Pajak'),
                  //     Text(
                  //       biayaPajak.currencyEYDFormatRp,
                  //       style: primaryTextStyle.copyWith(
                  //         fontWeight: bold,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text('Total Biaya'),
                  //     Text(
                  //       ((summaryOrderResponseModel.data.shippingCost +
                  //               summaryOrderResponseModel.data.handlingCost +
                  //               summaryOrderResponseModel
                  //                   .data.biayaParkirPelabuhan +
                  //               biayaPajak))
                  //           .currencyEYDFormatRp,
                  //       style: primaryTextStyle.copyWith(
                  //         fontWeight: bold,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _isUploadSuccessful ? Container() : selectFile(),
                  ),
                  if (selectedFile != null)
                    Text(
                      'Selected file: ${selectedFile!.path.split('/').last}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          error: (message) {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $message'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          success: (state) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Upload document sukses'), //menampilkan snackbar success
                                backgroundColor: Colors.green,
                              ),
                            );
                          });
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        orElse: () {
                          return Button.filled(
                            label: 'Upload',
                            onPressed: () {
                              final data = UpdateDocumentRequestModel(
                                  transactionId: widget.transactionIdMessage,
                                  type: 'shipping_instruction',
                                  method: 'PUT',
                                  document: selectedFile!);
                              context
                                  .read<UploadDocumentBloc>()
                                  .add(UploadDocumentEvent.upload(data));
                            },
                          );
                        },
                      );
                    },
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
