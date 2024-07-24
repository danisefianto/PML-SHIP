import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../auth/pages/sign_in_page.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rate Order',
        ),
        backgroundColor: const Color(0xFFDBEFEF), // Warna DBEFEF
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpaceHeight(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Kasih Rating Buat PML SHIP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SpaceHeight(20),
              // RatingBar.builder(
              //   initialRating: rating,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: false,
              //   itemCount: 5,
              //   itemPadding: EdgeInsets.symmetric(
              //       vertical: 150), // Padding antara bintang dengan judul
              //   itemBuilder: (context, _) {
              //     return Icon(
              //       Icons.star,
              //       color: Colors
              //           .amber, // Memberi warna kuning saat bintang diklik
              //     );
              //   },
              //   onRatingUpdate: (rating) {
              //     setState(() {
              //       this.rating = rating;
              //     });
              //   },
              //   updateOnDrag: true,
              //   unratedColor: Colors.grey,
              //   glow: false,
              //   itemSize: 40,
              // ),
              const SizedBox(
                  height:
                      10), // Padding antara bintang dengan teks "Apa yang menurutmu oke?"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Apa yang menurutmu oke?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SpaceHeight(10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  maxLines: null, // Unlimited lines
                  minLines: 3,
                  style: TextStyle(
                      color: AppColors.primaryColor), // Ubah warna teks
                  decoration: InputDecoration(
                    hintText: 'Tulis di sini...',
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    border: OutlineInputBorder(),
                    filled: true, // Mengaktifkan fill
                    fillColor: Color(0xFF4682B4), // Warna fill kolom
                  ),
                  textAlign: TextAlign.center, // Posisi teks di tengah
                ),
              ),
              const SpaceHeight(20), // Tambahkan jarak sekitar 20

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignInPage()), // Navigasi ke OTPPage3
                    );
                  },
                  label: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
