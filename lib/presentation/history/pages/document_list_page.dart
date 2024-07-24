import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/datasource/download_file.dart';
import '../bloc/documentData/document_data_bloc.dart';

class DocumentListPage extends StatefulWidget {
  final String transactionId;
  const DocumentListPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<DocumentListPage> createState() => _DocumentListPageState();
}

class _DocumentListPageState extends State<DocumentListPage> {
  File? selectedFile;

  @override
  void initState() {
    super.initState();
    context.read<DocumentDataBloc>().add(
          DocumentDataEvent.getDocumentsData(widget.transactionId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Document List'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<DocumentDataBloc, DocumentDataState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(child: Text('No data available'));
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (response) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Document data for transaction ID: ${widget.transactionId}'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: response.data.length,
                        itemBuilder: (context, index) {
                          final documentData = response.data[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                documentData.documentType !=
                                        'shipping_instruction'
                                    ? Visibility(
                                        // If document type is not shipping_instruction, show the select file widget
                                        visible:
                                            documentData.uploadedAt == null,
                                        child: Column(
                                          children: [
                                            Text(
                                                '${documentData.documentType} not uploaded yet'),
                                          ],
                                        ),
                                      )
                                    : Visibility(
                                        // If the document type is shipping_instruction and not uploaded, show this text
                                        visible: documentData.documentType ==
                                                'shipping_instruction' &&
                                            documentData.uploadedAt ==
                                                null, // Change to true to show the text
                                        child: const Text(
                                          'Shipping instruction will be uploaded by customer',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                Visibility(
                                  visible: documentData.documentName != null,
                                  child: Button.filled(
                                    onPressed: () {
                                      final String urlname =
                                          '${Variables.documentURL}${documentData.documentName}';
                                      log(urlname);
                                      FileStorage.downloadAndSaveFile(urlname);
                                    },
                                    icon: const Icon(
                                      Icons.download,
                                      color: AppColors.primaryColor,
                                    ),
                                    label: '${documentData.documentName}',
                                  ),
                                  // Text(
                                  //   documentData.documentName ?? '',
                                  //   style: const TextStyle(
                                  //     fontSize: 14,
                                  //     color: AppColors.primaryColor,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
