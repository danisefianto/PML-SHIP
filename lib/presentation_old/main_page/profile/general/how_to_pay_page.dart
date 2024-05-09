import 'package:flutter/material.dart';
import '../../../../common/styles.dart';

class HowToPayPage extends StatefulWidget {
  const HowToPayPage({Key? key}) : super(key: key);

  @override
  _HowToPayPageState createState() => _HowToPayPageState();
}

class _HowToPayPageState extends State<HowToPayPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('How To Pay'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xFFEAE5E5),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width * 0.95,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(
                  children: [
                    Text(
                      'PML SHIP mendukung berbagai transfer Rekening Bank dan atau kartu kredit:',
                      style: primaryTextStyle,
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/visa.png',
                            height: 50,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/americanexpress.png',
                            height: 50,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/jcb.png',
                            height: 50,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/mastercard.png',
                            height: 50,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/unionpay.png',
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kartu Kredit/debit lokal atau luar negeri',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
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
                    SizedBox(height: 20),
                    Text(
                      'Alternatif lainnya, anda juga bisa membayar dengan metode transfer seperti metode transfer pada umumnya yang akan diverifikasi secara manual dan otomatis melalui lampiran bukti yang dikirim pengguna.',
                      style: primaryTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Berikut adalah cara melakukan transfer:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/payment.jpg',
                          height: 500,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
