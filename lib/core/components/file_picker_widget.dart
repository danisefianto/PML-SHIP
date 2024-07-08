import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'buttons.dart';

class FilePickerWidget extends StatefulWidget {
  final String label;

  final bool showLabel;

  const FilePickerWidget({
    super.key,
    required this.label,
    this.showLabel = true,
  });

  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File? selectedFilePath; // Variable to store the selected file

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        selectedFilePath = File(pickedFile.files.single.path!);
      } else {
        selectedFilePath = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12.0),
        ],
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Button.filled(
              height: 30.0,
              width: 200.0,
              onPressed: _pickFile,
              label: 'Choose Photo',
              fontSize: 12.0,
              borderRadius: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
