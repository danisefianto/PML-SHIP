import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const ProfileMenuItem({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: primaryTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 13.0,
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: secondaryColor,
          )
        ],
      ),
    );
  }
}
