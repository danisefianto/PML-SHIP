import 'package:flutter/material.dart';

import '../../core/styles.dart';

class SelectDateWidget extends StatefulWidget {
  final TextEditingController dateController;
  final String labelText;
  const SelectDateWidget({
    super.key,
    required this.labelText,
    required this.dateController,
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
          style: primaryTextStyle,
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
              borderSide: BorderSide(color: Colors.blue),
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
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 180)));

    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
