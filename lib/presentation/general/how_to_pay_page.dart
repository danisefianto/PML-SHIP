import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../core/styles.dart';

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
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                    Text(
                      'PML SHIP mendukung berbagai transfer Rekening Bank dan atau kartu kredit:',
                      style: primaryTextStyle,
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.image.payment.imageVisaLogo.image(height: 50),
                          const SizedBox(width: 20),
                          Assets.image.payment.imageAmericanExpressLogo
                              .image(height: 50),
                          const SizedBox(width: 20),
                          Assets.image.payment.imageJcbLogo.image(height: 50),
                          const SizedBox(width: 20),
                          Assets.image.payment.imageMastercardLogo
                              .image(height: 50),
                          const SizedBox(width: 20),
                          Assets.image.payment.imageUnionpayLogo
                              .image(height: 50),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Kartu Kredit/debit lokal atau luar negeri',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Catatan: ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 16),
                        Flexible(
                          child: Text(
                            'Kartu Kredit/Debit yang didaftarkan harus sudah terverifikasi dengan 3d secure',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Inter',
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Alternatif lainnya, anda juga bisa membayar dengan metode transfer seperti metode transfer pada umumnya yang akan diverifikasi secara manual dan otomatis melalui lampiran bukti yang dikirim pengguna.',
                      style: primaryTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Berikut adalah cara melakukan transfer:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.image.payment.imagePaymentTutorial
                            .image(height: 400),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '*Menu Transfer di halaman Metode Pembayaran*\n'
                      'Pada menu *Beranda* > pilih *Order* > Melakukan pengisian *Request Order* dan *Planning Order* > pada  *Halaman Invoice*  klik Next > Kemudian pilih salah satu skema pembayaran  kemudian klik Bayar > Pilih salah satu akun rekening bank yang sesuai > lakukan transfer sesuai nominal > lampirkan bukti pada *Halaman Metode Pembayaran*',
                      style: primaryTextStyle,
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
