import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../../data/models/response/summary_order_response_model.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../home/bloc/summaryOrder/summary_order_bloc.dart';
import '../../home/bloc/upload_document/upload_document_bloc.dart';

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
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    context
        .read<SummaryOrderBloc>()
        .add(SummaryOrderEvent.getSummaryOrder(widget.transactionIdMessage));
  }

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        selectedFile = File(pickedFile.files.single.path!);
      } else {
        selectedFile = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectFile(String label) {
      return DottedBorder(
        strokeWidth: 3,
        dashPattern: const [6, 6],
        strokeCap: StrokeCap.round,
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: _pickFile,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1C3E66),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.folder_open_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildSummaryOrderUI(
        SummaryOrderResponseModel summaryOrderResponseModel) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // If shipping instruction document is uploaded, show payment
            Visibility(
              visible:
                  summaryOrderResponseModel.data.documents.first.documentName ==
                      null,
              child: buildUploadShipingInstructionDocumentHeader(
                  summaryOrderResponseModel),
            ),

            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildOrderInfoCard(summaryOrderResponseModel),
                  const Divider(),
                  buildShipperAndConsigneeInfo(
                    'Shipper Info',
                    summaryOrderResponseModel.data.shipper.name,
                    summaryOrderResponseModel.data.shipper.address,
                  ),
                  const Divider(),
                  buildShipperAndConsigneeInfo(
                    'Consignee Info',
                    summaryOrderResponseModel.data.consignee.name,
                    summaryOrderResponseModel.data.consignee.address,
                  ),
                  const Divider(),
                  buildPaymentSummary(summaryOrderResponseModel),
                  const SizedBox(height: 30),
                  Visibility(
                      visible: summaryOrderResponseModel
                              .data.documents.first.documentName ==
                          null,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: selectFile(
                                "Select Shipping Instruction Document"),
                          ),
                          if (selectedFile != null)
                            Text(
                              'Selected file: ${selectedFile!.path.split('/').last}',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          const SizedBox(height: 30),
                          BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                error: (message) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: $message'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                                success: (state) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Upload document success'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  setState(() {
                                    selectedFile =
                                        null; // Clear the file picker after success
                                  });
                                },
                              );
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                orElse: () => Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: Button.filled(
                                    label: 'Upload',
                                    onPressed: () {
                                      final dataRequest =
                                          UpdateDocumentRequestModel(
                                        documentType: 'shipping_instruction',
                                        method: 'PUT',
                                        documentFile: selectedFile!,
                                      );

                                      context.read<UploadDocumentBloc>().add(
                                            UploadDocumentEvent.uploadDocument(
                                              dataRequest,
                                              summaryOrderResponseModel
                                                  .data.transactionId,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                  Visibility(
                    visible: summaryOrderResponseModel
                            .data.documents.first.documentName !=
                        null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Instruction Document',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.picture_as_pdf),
                              const SizedBox(width: 8),
                              Text(
                                summaryOrderResponseModel
                                        .data.documents.first.documentName ??
                                    '',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: summaryOrderResponseModel
                            .data.documents.first.documentName !=
                        null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Proof Document',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.picture_as_pdf),
                              SizedBox(width: 8),
                              // Text(
                              //   summaryOrderResponseModel.data.payment.payments
                              //           .first.paymentProofDocument ??
                              //       '',
                              //   style: primaryTextStyle.copyWith(
                              //     fontWeight: bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: summaryOrderResponseModel
                              .data.documents.first.documentName !=
                          null
                      //      &&
                      // summaryOrderResponseModel.data.payment.payments.any(
                      //     (payment) =>
                      //         payment.paymentProofDocument == null
                      // )
                      ,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.choosePayment,
                            arguments: widget.transactionIdMessage,
                          );
                        },
                        child: const Text('Choose payment'),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Order'),
        ),
        body: BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (summaryOrderResponseModel) =>
                  buildSummaryOrderUI(summaryOrderResponseModel),
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
    );
  }

  Container buildShipperAndConsigneeInfo(
      String title, String name, String address) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardHeader(title),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              name,
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              address,
              style: primaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Container buildCardHeader(String title) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.amber),
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: primaryTextStyle.copyWith(fontWeight: bold),
      ),
    );
  }

  Container buildUploadShipingInstructionDocumentHeader(
      SummaryOrderResponseModel summaryOrderResponseModel) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFB2DFDB)),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  'Upload Shipping Instruction Document',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Max input ${summaryOrderResponseModel.data.documents.first.maxInputDocumentAt?.toIso8601String()}.',
                  style: primaryTextStyle.copyWith(
                    fontWeight: regular,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOrderInfoCard(
      SummaryOrderResponseModel summaryOrderResponseModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardHeader('Detail pesanan'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction ID: ${summaryOrderResponseModel.data.transactionId}',
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
                Text(
                  '${summaryOrderResponseModel.data.loading.port} - ${summaryOrderResponseModel.data.discharge.port}',
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
                Text(
                  'Date of Loading: ${summaryOrderResponseModel.data.loading.date.toFormattedIndonesianLongDate()}',
                  style: primaryTextStyle.copyWith(fontWeight: light),
                ),
                Text(
                  'Date of Discharge: ${summaryOrderResponseModel.data.discharge.date.toFormattedIndonesianLongDate()}',
                  style: primaryTextStyle.copyWith(fontWeight: light),
                ),
                const Divider(),
                Text(
                  'Cargo Description: ${summaryOrderResponseModel.data.cargo.description}',
                  style: primaryTextStyle,
                ),
                Text(
                  'Cargo Weight: ${summaryOrderResponseModel.data.cargo.weight}',
                  style: primaryTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentSummary(
      SummaryOrderResponseModel summaryOrderResponseModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan Pembayaran',
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        paymentSubItem(
          'Biaya Pengiriman',
          summaryOrderResponseModel
              .data.payment.shippingCost.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Penanganan',
          summaryOrderResponseModel
              .data.payment.handlingCost.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Parkir Pelabuhan',
          summaryOrderResponseModel
              .data.payment.biayaParkirPelabuhan.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Pajak',
          summaryOrderResponseModel.data.payment.tax.currencyEYDFormatRp,
        ),
        const Divider(),
        paymentSubItem(
          'Total Biaya',
          summaryOrderResponseModel.data.payment.totalBill.currencyEYDFormatRp,
        ),
      ],
    );
  }

  Row paymentSubItem(String label, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          content,
          style: primaryTextStyle.copyWith(fontWeight: bold),
        ),
      ],
    );
  }
}
