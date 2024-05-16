import 'package:flutter/material.dart';

import 'alamatpelabuhan_item_widget.dart';
// import 'package:pml_ship/core/app_export.dart';

// import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';

class AlamatPelabuhanScreen extends StatelessWidget {
  const AlamatPelabuhanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Port Location'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Color(0xFFD9D9D9), // Warna latar belakang layar
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
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
                  SizedBox(height: 19),
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
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    separatorBuilder: (context, index) {
      return SizedBox(
        height: 20,
      );
    },
    itemCount: 3,
    itemBuilder: (context, index) {
      return AlamatPelabuhanItemWidget();
    },
  );
}
