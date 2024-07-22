import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../history/bloc/documentData/document_data_bloc.dart';

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
                                            ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.pushNamed(context,
                                                  //     AppRoutes.uploadDocument,
                                                  //     arguments: {
                                                  //       'transactionId': widget
                                                  //           .transactionId,
                                                  //       'documentType':
                                                  //           documentData
                                                  //               .documentType,
                                                  //     });
                                                },
                                                child: const Text(
                                                    'No data. Please select to upload document')),
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
                                  child: Text(
                                    documentData.documentName ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
              const SpaceWidth(16),
              Text(
                label,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
