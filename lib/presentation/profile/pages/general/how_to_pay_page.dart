import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HowToPayPage extends StatefulWidget {
  const HowToPayPage({super.key});

  @override
  State<HowToPayPage> createState() => _HowToPayPageState();
}

class _HowToPayPageState extends State<HowToPayPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('How To Pay'),
        ),
        // backgroundColor: const Color(0xFFEAE5E5),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width * 0.95,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    // color: Colors.grey,
                    ),
                child: Column(
                  children: [
                    const Text(
                      'PML SHIP mendukung berbagai transfer Rekening Bank dan atau kartu kredit:',
                    ),
                    const SpaceHeight(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.image.payment.imageVisaLogo.image(height: 50),
                          const SpaceWidth(20),
                          Assets.image.payment.imageAmericanExpressLogo
                              .image(height: 50),
                          const SpaceWidth(20),
                          Assets.image.payment.imageJcbLogo.image(height: 50),
                          const SpaceWidth(20),
                          Assets.image.payment.imageMastercardLogo
                              .image(height: 50),
                          const SpaceWidth(20),
                          Assets.image.payment.imageUnionpayLogo
                              .image(height: 50),
                        ],
                      ),
                    ),
                    const SpaceHeight(10),
                    const Text(
                      'Kartu Kredit/debit lokal atau luar negeri',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SpaceHeight(10),
                    const Row(
                      children: [
                        SpaceWidth(10),
                        Text(
                          'Catatan: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SpaceWidth(16),
                        Flexible(
                          child: Text(
                            'Kartu Kredit/Debit yang didaftarkan harus sudah terverifikasi dengan 3d secure',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontFamily: 'Inter',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(20),
                    const Text(
                      'Alternatif lainnya, anda juga bisa membayar dengan metode transfer seperti metode transfer pada umumnya yang akan diverifikasi secara manual dan otomatis melalui lampiran bukti yang dikirim pengguna.',
                      textAlign: TextAlign.justify,
                    ),
                    const SpaceHeight(20),
                    const Text(
                      'Berikut adalah cara melakukan transfer:',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SpaceHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.image.payment.imagePaymentTutorial
                            .image(height: 400),
                      ],
                    ),
                    const SpaceHeight(20),
                    const Text(
                      '*Menu Transfer di halaman Metode Pembayaran*\n'
                      'Pada menu *Beranda* > pilih *Order* > Melakukan pengisian *Request Order* dan *Planning Order* > pada  *Halaman Invoice*  klik Next > Kemudian pilih salah satu skema pembayaran  kemudian klik Bayar > Pilih salah satu akun rekening bank yang sesuai > lakukan transfer sesuai nominal > lampirkan bukti pada *Halaman Metode Pembayaran*',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
