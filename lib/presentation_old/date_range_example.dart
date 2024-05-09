import 'package:flutter/material.dart';

class DatePickerApp extends StatefulWidget {
  const DatePickerApp({super.key});

  @override
  State<DatePickerApp> createState() => _DatePickerAppState();
}

class _DatePickerAppState extends State<DatePickerApp> {
  DateTimeRange? selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 30)),
      ),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      final differenceInDays = picked.end.difference(picked.start).inDays;
      if (differenceInDays > 30) {
        showWarningDialog(context);
      } else {
        setState(() {
          selectedDateRange = picked;
        });
        // Process the selected date range (less than 30 days) here
      }
    }
  }

  void showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selection Limit Exceeded"),
        content: const Text("You can only select a maximum of 30 days."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _selectDateRange(context),
            child: const Text("Select Date Range"),
          ),
          SizedBox(
            height: 100,
          ),
          if (selectedDateRange != null)
            Text(
                'Selected: ${selectedDateRange!.start.toString()} - ${selectedDateRange!.end.toString()}'),
        ],
      ),
    );
  }
}
