import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class SelectDateWidget extends StatefulWidget {
  final TextEditingController dateController;
  final String labelText;
  final DateTime? initialDate; //By default it is null

  final DateTime firstDate;
  final DateTime lastDate;
  const SelectDateWidget({
    super.key,
    required this.labelText,
    required this.dateController,
    required this.lastDate,
    required this.firstDate,
    this.initialDate,
  });

  @override
  State<SelectDateWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  // TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextField(
          controller: widget.dateController,
          decoration: const InputDecoration(
            hintText: 'Select date',
            filled: true,
            prefixIcon: Icon(Icons.calendar_today),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
            ),
          ),
          readOnly: true,
          onTap: () {
            _selectDate();
          },
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget
          .initialDate, // If null/not set, it will not select default date in range [firstDate] and [lastDate]. If set/have value, it will select the default date.
      firstDate: widget.firstDate, //earliest allowable date
      lastDate: widget.lastDate, //latest allowable date
    );

    if (picked != null) {
      setState(() {
        widget.dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
