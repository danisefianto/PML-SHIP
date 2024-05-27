import 'package:flutter/material.dart';
import '../../core/components/buttons.dart';
import 'metode_pembayaran_satu_widget.dart';
import '../../core/styles.dart';

class MetodePembayaranSatuPage extends StatefulWidget {
  const MetodePembayaranSatuPage({super.key});

  @override
  State<MetodePembayaranSatuPage> createState() =>
      _MetodePembayaranSatuPageState();
}

class _MetodePembayaranSatuPageState extends State<MetodePembayaranSatuPage> {
  bool isSelected = false; // Declare isSelected variable here

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Metode Pembayaran",
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 4),
                      const Divider(
                        color: Color(0xFF4682B4), // Warna garis
                        thickness: 2, // Ketebalan garis
                      ),
                      const SizedBox(height: 35),
                      Text(
                        "Pembayaran I",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                _buildWaktuPembayaran(context),
                const SizedBox(height: 31),
                _buildCaraPembayaran(context),
                const SizedBox(height: 29),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Upload Bukti Pembayaran",
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 124,
                        width: 275,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4682B4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 31),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Button.filled(
                    onPressed: () {},
                    label: 'Next',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'PML SHIP',
        style: primaryTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 14.0,
        ),
      ),
      leading: const Icon(Icons.chevron_left),
    );
  }

  /// Section Widget
  Widget _buildWaktuPembayaran(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5, // Menambahkan flex untuk memberikan ruang lebih pada teks
            child: Text(
              "Waktu Pembayaran Selama",
              style: primaryTextStyle,
              overflow: TextOverflow
                  .ellipsis, // Mengatasi overflow teks jika terlalu panjang
            ),
          ),
          const SizedBox(
              width: 10), // Memberikan jarak horizontal antara teks dan waktu
          Flexible(
            // Menggunakan Flexible untuk mengatasi overflow pada waktu
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                "23 Hours: 59 Minutes",
                style: primaryTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaraPembayaran(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 2,
              thickness: 2,
              color: Color(0xFF4682B4),
            ),
          ),
        );
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Kartu Debit",
              bankName: "Bank BCA",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 1:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "Bank Mandiri",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 2:
            return MetodePembayaranSatuWidget(
              paymentMethod: "OneKlik",
              bankName: "BCA",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 3:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BNI",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 4:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BRI",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          case 5:
            return MetodePembayaranSatuWidget(
              paymentMethod: "Transfer Bank",
              bankName: "BTN",
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
