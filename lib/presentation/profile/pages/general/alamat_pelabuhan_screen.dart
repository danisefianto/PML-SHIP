import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'alamat_pelabuhan_item_widget.dart';

class AlamatPelabuhanScreen extends StatelessWidget {
  const AlamatPelabuhanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Port Location'),
        ),
        body: Container(
          color: const Color(0xFFD9D9D9), // Warna latar belakang layar
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Data Alamat Pelabuhan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Sesuaikan jika diperlukan
                        color: AppColors.black, // Warna teks hitam
                      ),
                    ),
                  ),
                  const SpaceHeight(19),
                  _buildAlamatPelabuhan(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAlamatPelabuhan(BuildContext context) {
  return ListView.separated(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 20,
      );
    },
    itemCount: 3,
    itemBuilder: (context, index) {
      return const AlamatPelabuhanItemWidget();
    },
  );
}
