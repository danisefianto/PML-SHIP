import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/datasource/download_file.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../home/bloc/summaryOrder/summary_order_bloc.dart';
import '../../home/bloc/upload_document/upload_document_bloc.dart';
import '../widgets/build_on_shipping_header.dart';
import '../widgets/build_order_info_card.dart';
import '../widgets/build_payment_header.dart';
import '../widgets/build_payment_summary.dart';
import '../widgets/build_payment_waiting_for_approval_header.dart';
import '../widgets/build_shipper_and_consignee_info.dart';
import '../widgets/build_upload_shipping_instruction_document_header.dart';
import '../widgets/select_file_widget.dart';
import 'choose_payment_plan_page.dart';
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
                String firstPaymentProofDocument = '';
                String secondPaymentProofDocument = '';
                String thirdPaymentProofDocument = '';
                bool isFirstPaymentProofDocumentUploaded = false;
                bool isStatusCanceled =
                    responseModel.data!.status != 'order_canceled';

                bool isShippingInstructionUploaded =
                    responseModel.data!.documents!.first.documentName == null &&
                        isStatusCanceled;

                // If first payment proof document is not uploaded, show choose payment plan button

                // bool isSecondPaymentProofDocumentUploaded =
                //     responseModel.data!.payment!.payments!.length > 1
                //         ? responseModel.data!.payment!.payments![1]
                //                 .paymentProofDocument !=
                //             null
                //         : false;

                // bool isThirdPaymentProofDocumentUploaded =
                //     responseModel.data!.payment!.payments!.length > 2
                //         ? responseModel.data!.payment!.payments![2]
                //                 .paymentProofDocument !=
                //             null
                //         : false;

                if (responseModel.data!.payment!.payments!.isNotEmpty) {
                  firstPaymentProofDocument = responseModel.data!.payment!
                          .payments!.first.paymentProofDocument ??
                      '';
                  isFirstPaymentProofDocumentUploaded = responseModel.data!
                              .payment!.payments!.first.paymentProofDocument !=
                          null &&
                      responseModel.data!.payment!.payments!.first
                          .paymentProofDocument!.isNotEmpty;
                  if (responseModel.data!.payment!.payments!.length > 1) {
                    secondPaymentProofDocument = responseModel
                            .data!.payment!.payments![1].paymentProofDocument ??
                        '';
                  } else {
                    secondPaymentProofDocument = ''; // Or some default value
                  }

                  if (responseModel.data!.payment!.payments!.length > 2) {
                    thirdPaymentProofDocument = responseModel
                            .data!.payment!.payments![2].paymentProofDocument ??
                        '';
                  } else {
                    thirdPaymentProofDocument = ''; // Or some default value
                  }
                }

                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // If shipping instruction document is not uploaded, show Max input date
                      Visibility(
                        visible: isShippingInstructionUploaded,
                        child: BuildUploadShippingInstructionDocumentHeader(
                            responseModel: responseModel),
                      ),

                      // If shipping instruction document is uploaded, show Max Payment date
                      Visibility(
                        visible:
                            responseModel.data!.documents!.first.documentName !=
                                    null &&
                                !isFirstPaymentProofDocumentUploaded &&
                                isStatusCanceled,
                        child: BuildPaymentHeader(responseModel: responseModel),
                      ),

                      // If payment proof document is uploaded, show 'Please Wait for Admin Approval'
                      Visibility(
                        visible: isFirstPaymentProofDocumentUploaded &&
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

                      const SpaceHeight(20),
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
                                      visible: isShippingInstructionUploaded,
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
                                                  color: AppColors.black),
                                            ),
                                          const SpaceHeight(30),
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
                                                          AppColors.green,
                                                    ),
                                                  );
                                                  setState(() {
                                                    selectedFile =
                                                        null; // Clear the file picker after success
                                                  });
                                                  context
                                                      .read<SummaryOrderBloc>()
                                                      .add(SummaryOrderEvent
                                                          .getSummaryOrder(widget
                                                              .transactionId));
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
                                          const Text(
                                            'Shipping Instruction Document',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            ),
                                          ),

                                          const SpaceHeight(8),
                                          Button.filled(
                                            onPressed: () {
                                              final String urlname =
                                                  '${Variables.documentURL}${responseModel.data!.documents!.first.documentName}';
                                              log(urlname);
                                              FileStorage.downloadAndSaveFile(
                                                  urlname);
                                            },
                                            icon: const Icon(
                                              Icons.download,
                                              color: AppColors.primaryColor,
                                            ),
                                            label:
                                                '${responseModel.data!.documents!.first.documentName}',
                                          ),
                                          // Row(
                                          //   children: [
                                          //     const Icon(Icons.picture_as_pdf),
                                          //     const SpaceWidth(8),
                                          //     Text(
                                          //       responseModel.data!.documents!
                                          //               .first.documentName ??
                                          //           '',
                                          //       style: const TextStyle(
                                          //         fontWeight: FontWeight.w700,
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          const SpaceHeight(15),

                                          Visibility(
                                            visible:
                                                !isFirstPaymentProofDocumentUploaded,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 30.0),
                                              child: Button.filled(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChoosePaymentPlanPage(
                                                        transactionId: widget
                                                            .transactionId,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                label: 'Choose payment plan',
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                isFirstPaymentProofDocumentUploaded,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Payment Proof',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SpaceHeight(8),
                                                Button.filled(
                                                  onPressed: () {
                                                    final String urlname =
                                                        '${Variables.documentURL}$firstPaymentProofDocument';
                                                    log(urlname);
                                                    FileStorage
                                                        .downloadAndSaveFile(
                                                            urlname);
                                                  },
                                                  icon: const Icon(
                                                    Icons.download,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                  label:
                                                      firstPaymentProofDocument,
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
