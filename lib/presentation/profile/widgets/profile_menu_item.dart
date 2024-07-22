import 'package:flutter/material.dart';

import '../../../core/core.dart';

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
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.blue,
          )
        ],
      ),
    );
  }
}
