import 'package:flutter/material.dart';

import 'alamatpelabuhan_item_widget.dart';
// import 'package:pml_ship/core/app_export.dart';

// import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';

class AlamatPelabuhanScreen extends StatelessWidget {
  const AlamatPelabuhanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Port Location'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Data Alamat Pelabuhan",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, // Sesuaikan jika diperlukan
                        color: Colors.black, // Warna teks hitam
                      ),
                    ),
                  ),
                  const SizedBox(height: 19),
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
