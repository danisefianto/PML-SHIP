import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/presentation/history/widgets/build_on_shipping_header.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../home/bloc/summaryOrder/summary_order_bloc.dart';
import '../../home/bloc/upload_document/upload_document_bloc.dart';
import '../widgets/build_order_info_card.dart';
import '../widgets/build_payment_header.dart';
import '../widgets/build_payment_summary.dart';
import '../widgets/build_payment_waiting_for_approval_header.dart';
import '../widgets/build_shipper_and_consignee_info.dart';
import '../widgets/build_upload_shipping_instruction_document_header.dart';
import '../widgets/select_file_widget.dart';
import 'document_list_page.dart';

class OrderDetailPage extends StatefulWidget {
  final String transactionId;

  const OrderDetailPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  File? selectedFile;

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
  void initState() {
    super.initState();
    context
        .read<SummaryOrderBloc>()
        .add(SummaryOrderEvent.getSummaryOrder(widget.transactionId));
  }

  @override
  Widget build(BuildContext context) {
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
              success: (responseModel) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // If shipping instruction document is not uploaded, show Max input date
                      Visibility(
                        visible:
                            responseModel.data!.documents!.first.documentName ==
                                null,
                        child: BuildUploadShippingInstructionDocumentHeader(
                            responseModel: responseModel),
                      ),

                      // If shipping instruction document is uploaded, show Max Payment date
                      Visibility(
                        visible:
                            responseModel.data!.documents!.first.documentName !=
                                    null &&
                                responseModel.data!.payment!.payments!.any(
                                    (payment) =>
                                        payment.paymentProofDocument == null),
                        child: BuildPaymentHeader(responseModel: responseModel),
                      ),

                      // If payment proof document is uploaded, show 'Please Wait for Admin Approval'
                      Visibility(
                        visible:
                            // responseModel.data!.documents!.first.documentName !=
                            //         null &&
                            responseModel.data!.payment!.payments!.any(
                                    (payment) =>
                                        payment.paymentProofDocument != null) &&
                                responseModel.data!.status == 'payment_pending',
                        child: BuildPaymentWaitingForApprovalHeader(
                            responseModel: responseModel),
                      ),
                      // If status is 'on_shipping', show 'Shipping in progress'
                      Visibility(
                        visible: responseModel.data!.status == 'on_shipping',
                        child:
                            BuildOnShippingHeader(responseModel: responseModel),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildOrderInfoCard(
                                summaryOrderResponseModel: responseModel),
                            const Divider(),
                            BuildShipperAndConsigneeInfo(
                              title: 'Shipper Info',
                              name: '${responseModel.data!.shipper!.name}',
                              address:
                                  '${responseModel.data!.shipper!.address}',
                            ),
                            const Divider(),
                            BuildShipperAndConsigneeInfo(
                              title: 'Consignee Info',
                              name: '${responseModel.data!.consignee!.name}',
                              address:
                                  '${responseModel.data!.consignee!.address}',
                            ),
                            const Divider(),
                            BuildPaymentSummary(
                              summaryOrderResponseModel: responseModel,
                            ),

                            const SpaceHeight(30),

                            Visibility(
                              visible:
                                  responseModel.data!.status == 'on_shipping',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Button.filled(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DocumentListPage(
                                            transactionId: widget.transactionId,
                                          ),
                                        ),
                                      );
                                    },
                                    label: 'Document List',
                                  ),
                                  const SpaceHeight(30),
                                ],
                              ),
                            ),
                            Visibility(
                              visible:
                                  responseModel.data!.status != 'on_shipping',
                              child: Column(
                                children: [
                                  Visibility(
                                      visible: responseModel.data!.documents!
                                              .first.documentName ==
                                          null,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SelectFileWidget(
                                              label:
                                                  "Select Shipping Instruction Document",
                                              onTap: _pickFile,
                                            ),
                                          ),
                                          if (selectedFile != null)
                                            Text(
                                              'Selected file: ${selectedFile!.path.split('/').last}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          const SizedBox(height: 30),
                                          BlocConsumer<UploadDocumentBloc,
                                              UploadDocumentState>(
                                            listener: (context, state) {
                                              state.maybeWhen(
                                                orElse: () {},
                                                error: (message) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Error: $message'),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  );
                                                },
                                                success: (state) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Upload document success'),
                                                      backgroundColor:
                                                          Colors.green,
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
                                                    child:
                                                        CircularProgressIndicator()),
                                                orElse: () => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 30.0),
                                                  child: Button.filled(
                                                    label: 'Upload',
                                                    onPressed: () {
                                                      final dataRequest =
                                                          UpdateDocumentRequestModel(
                                                        documentType:
                                                            'shipping_instruction',
                                                        method: 'PUT',
                                                        documentFile:
                                                            selectedFile!,
                                                      );

                                                      context
                                                          .read<
                                                              UploadDocumentBloc>()
                                                          .add(
                                                            UploadDocumentEvent
                                                                .uploadDocument(
                                                              dataRequest,
                                                              '${responseModel.data!.transactionId}',
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
                                  // If shipping instruction document is uploaded, show document. And show choose payment plan button
                                  Visibility(
                                    visible: responseModel.data!.documents!
                                            .first.documentName !=
                                        null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                responseModel.data!.documents!
                                                        .first.documentName ??
                                                    '',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontWeight: bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SpaceHeight(15),
                                          // https://www.youtube.com/watch?v=LdRdc7JWo3M
                                          // Button.filled(
                                          //   onPressed: () {
                                          //     log('${Variables.imageUrl}/documents/${responseModel.data!.documents!.first.documentName}');
                                          //     _progress != null
                                          //         ? const CircularProgressIndicator()
                                          //         : FileDownloader.downloadFile(
                                          //             url:
                                          //                 '${Variables.imageUrl}/documents/${responseModel.data!.documents!.first.documentName}',
                                          //             onProgress: (name, progress) {
                                          //               setState(() {
                                          //                 _progress = progress;
                                          //               });
                                          //             },
                                          //             onDownloadCompleted: (value) {
                                          //               // SnackBar
                                          //               ScaffoldMessenger.of(context)
                                          //                   .showSnackBar(
                                          //                 const SnackBar(
                                          //                   content: Text(
                                          //                       'Download completed!'),
                                          //                   backgroundColor:
                                          //                       Colors.green,
                                          //                 ),
                                          //               );
                                          //             },
                                          //           );
                                          //   },
                                          //   label: 'Download Document',
                                          // ),
                                          // TODO: Payment Bug
                                          // Visibility(
                                          //   visible: responseModel
                                          //       .data!.payment!.payments!
                                          //       .any((payment) =>
                                          //           payment
                                          //               .paymentProofDocument ==
                                          //           null),
                                          //   child:
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 30.0),
                                            child: Button.filled(
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    AppRoutes.choosePayment,
                                                    arguments:
                                                        widget.transactionId,
                                                  );
                                                },
                                                label: 'Choose payment plan'),
                                          ),
                                          // ),
                                          Visibility(
                                            visible: responseModel
                                                .data!.payment!.payments!
                                                .any((payment) =>
                                                    payment
                                                        .paymentProofDocument !=
                                                    null),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Payment Proof',
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.picture_as_pdf),
                                                    const SizedBox(width: 8),
                                                    // TODO: Payment Bug
                                                    // Text(
                                                    //   responseModel
                                                    //           .data!
                                                    //           .payment!
                                                    //           .payments!
                                                    //           .first
                                                    //           .paymentProofDocument ??
                                                    //       '',
                                                    //   style: primaryTextStyle
                                                    //       .copyWith(
                                                    //     fontWeight: bold,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                                const SpaceHeight(30),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // If shipping instruction document is not uploaded, show upload document form

                            // Visibility(
                            //   visible: responseModel
                            //           .data!.documents!.first.documentName !=
                            //       null
                            //   //      &&
                            // summaryOrderResponseModel.data.payment.payments.any(
                            //     (payment) =>
                            //         payment.paymentProofDocument == null
                            // )
                            //   ,
                            //   child:
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
    );
  }
}
