import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class AlamatPelabuhanItemWidget extends StatelessWidget {
  const AlamatPelabuhanItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFF4682B4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceWidth(10),
                Assets.image.port.imagePort01.image(),
                const SpaceWidth(10),
                Assets.image.port.imagePort02.image(),
              ],
            ),
            const SpaceHeight(9),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return const Row(
      children: [
        Text('Bongkar Muat, Gudang'),
        SpaceWidth(10),
        Text('Rp 1000,000/Container, Rp. 50,000/hari'),
        SpaceWidth(10),
        Text('Senin - Jumat: 08.00 - 17.00 WIB'),
      ],
    );
  }
}
