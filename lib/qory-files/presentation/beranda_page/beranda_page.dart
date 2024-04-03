import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/halaman_input_order_screen/halaman_input_order_screen.dart';
import 'package:pml_ship/presentation/halaman_list_dokumen_screen/halaman_list_dokumen_screen.dart';
import 'package:pml_ship/presentation/risk_mitigation_screen/risk_mitigation_screen.dart';
import 'package:pml_ship/presentation/tracking_one_screen/tracking_one_screen.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/custom_search_view.dart';
import 'package:pml_ship/presentation/profil_akun_screen/profil_akun_screen.dart';

// ignore: must_be_immutable
class BerandaPage extends StatelessWidget {
  // Hapus super.key karena tidak perlu
  BerandaPage();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearch(),
            const SizedBox(height: 41),
            _buildOrderSection(context),
            _buildPromoSection(),
            const SizedBox(height: 13),
            _buildLihatSemua(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return const CustomAppBar(
      height: 39,
      leadingWidth: 53,
      leading: AppbarLeadingImage(
        imagePath: 'assets/images/img_9_3_29x53.png',
        marginTop: 5,
        marginBottom: 5,
        marginLeft: 6,
        alignment: Alignment.center,
        height: 29,
      ),
      title: AppbarTitle(
        text: "PML SHIP",
        margin: EdgeInsets.only(left: 6),
        alignment: Alignment.center,
        marginLeft: 0,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4682B4),
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: 'assets/images/img_contrast.png',
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          alignment: Alignment.center,
        ),
      ],
      styleType: Style.bgFill,
      marginLeft: 0,
    );
  }

  Widget _buildSearch() {
    return SizedBox(
      height: 213,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CustomImageView(
            imagePath: 'assets/images/img_group_25.svg',
            width: 41,
            height: 5,
            marginBottom: 10,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 7),
          ),
          const CustomImageView(
            imagePath: 'assets/images/img_group_53.png',
            width: 359,
            height: 213,
            marginBottom: 10,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 213,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const CustomImageView(
                    imagePath: 'assets/images/img_image_6.png',
                    width: 360,
                    height: 213,
                    marginBottom: 10,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: CustomSearchView(
                        width: 343,
                        controller: searchController,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 63),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOrderItem(context, "Order", Icons.shopping_cart, "Order"),
              _buildOrderItem(context, "Tracking Order", Icons.location_on,
                  "Tracking Order"),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOrderItem(context, "Mitigation Risk", Icons.security,
                  "Mitigation Risk"),
              _buildOrderItem(
                  context, "Document List", Icons.description, "Document List"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
      BuildContext context, String text, IconData iconData, String label) {
    return GestureDetector(
      onTap: () {
        if (label == "Order") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HalamanInputOrderScreen()),
          );
        } else if (label == "Tracking Order") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TrackingOneScreen()),
          );
        } else if (label == "Mitigation Risk") {
          // Ganti label "Risk Mitigation" menjadi "Mitigation Risk"
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RiskMitigationScreen()), // Ganti builder dengan RiskMitigationScreen
          );
        } else if (label == "Document List") {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HalamanListDokumenScreen()),
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: appTheme.indigo20001,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  iconData,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 23),
        Padding(
          padding: const EdgeInsets.only(left: 37),
          child: Text(
            "Promo",
            style: theme.textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 2),
        const CustomImageView(
          imagePath: 'assets/images/img_image_11.png',
          width: 310,
          height: 163,
          marginBottom: 10,
        ),
        const SizedBox(height: 13),
      ],
    );
  }

  Widget _buildLihatSemua() {
    return SizedBox(
      height: 206,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 87),
                  child: Text(
                    "History",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                          width: 8); // Sesuaikan jarak antar gambar
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      // Mengubah kode ini untuk menampilkan gambar dari img_group_53.png
                      final assetPath = index.isEven
                          ? 'assets/images/img_image_9.png'
                          : 'assets/images/img_image_10.png';
                      return Image.asset(
                        assetPath,
                        height:
                            213, // Sesuaikan tinggi gambar sesuai dengan img_group_53.png
                        width: 400, // Lebarkan gambar
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFDBEFEF), // Set the background color
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFFDBEFEF), // Set the background color
        unselectedItemColor:
            Colors.white, // Set the color of unselected items to white
        selectedItemColor:
            const Color(0xFF4682B4), // Set the color of selected items to blue
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilAkunScreen()),
            );
          } else if (index == 1) {
            Navigator.pushNamed(
              context,
              AppRoutes.halamanRiwayatonescreen,
            );
          }
        },
      ),
    );
  }
}
