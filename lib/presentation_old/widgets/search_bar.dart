import 'package:flutter/material.dart';
import '../../common/styles.dart';

class SearchBarWidget extends StatefulWidget {
  final String customHintText;
  final double customPadding;
  const SearchBarWidget({
    super.key,
    this.customHintText = '',
    this.customPadding = 0,
  });

  String get getHintText => customHintText;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: defaultMargin,
        left: widget.customPadding,
        right: widget.customPadding,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust padding as needed
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Set background color
          borderRadius: BorderRadius.circular(10.0), // Add rounded corners
          border: Border.all(
            // Add a border
            color: Colors.grey.shade400, // Set border color
            width: 1.0, // Adjust border width
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                // Text field for user input
                decoration: InputDecoration(
                  hintText: widget.getHintText,
                  hintStyle: primaryTextStyle,
                  border: InputBorder.none, // Remove default border
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
