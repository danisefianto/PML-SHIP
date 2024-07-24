import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AlamatPelabuhanItemWidget extends StatelessWidget {
  const AlamatPelabuhanItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.blue,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceWidth(10),
              Assets.image.port.imagePort01.image(
                height: 100,
              ),
              const SpaceWidth(10),
              Assets.image.port.imagePort02.image(
                height: 100,
              ),
            ],
          ),
          const SpaceHeight(9),
          const Text('Bongkar Muat, Gudang'),
          const SpaceWidth(10),
          const Text('Rp 1000,000/Container, Rp. 50,000/hari'),
          const SpaceWidth(10),
          const Text('Senin - Jumat: 08.00 - 17.00 WIB'),
        ],
      ),
    );
  }
}
