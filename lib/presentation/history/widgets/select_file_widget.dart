import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SelectFileWidget extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const SelectFileWidget({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<SelectFileWidget> createState() => _SelectFileWidgetState();
}

class _SelectFileWidgetState extends State<SelectFileWidget> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 3,
      dashPattern: const [6, 6],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: widget.onTap,
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
                widget.label,
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
