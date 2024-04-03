import 'package:flutter/material.dart';

class carapembayaran extends StatefulWidget {
  const carapembayaran({Key? key}) : super(key: key);

  @override
  _carapembayaranState createState() => _carapembayaranState();
}

class _carapembayaranState extends State<carapembayaran> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'images/logo.png',
              width: 60,
              height: 60,
            ),
            SizedBox(width: 20),
            Text(
              'PML SHIP',
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4682B4),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDBEFEF),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'images/logokontak.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFEAE5E5),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4682B4),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    "<  Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Cara Pembayaran',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Color(0xFF4682B4),
              thickness: 6,
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'PML SHIP mendukung berbagai transfer Rekening Bank dan atau kartu kredit:',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/visa.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'images/americanexpress.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'images/jcb.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'images/mastercard.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'images/unionpay.png',
                        height: 50,
                      ),
                    ],
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
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
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
                        'images/payment.jpg',
                        height: 500,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '*Menu Transfer di halaman Metode Pembayaran*\n'
                    'Pada menu *Beranda* > pilih *Order* > Melakukan pengisian *Request Order* dan *Planning Order* > pada  *Halaman Invoice*  klik Next > Kemudian pilih salah satu skema pembayaran  kemudian klik Bayar > Pilih salah satu akun rekening bank yang sesuai > lakukan transfer sesuai nominal > lampirkan bukti pada *Halaman Metode Pembayaran*',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
