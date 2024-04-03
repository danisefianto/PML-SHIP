import 'package:flutter/material.dart';
import 'package:pml_ship/presentation/email_sudah_diverifikasi_screen/email_sudah_diverifikasi_screen.dart';
import 'package:pml_ship/presentation/keamanan_akun_screen/keamanan_akun_screen.dart';
import 'package:pml_ship/widgets/app_bar/appbar_leading_image.dart';
import 'package:pml_ship/widgets/app_bar/appbar_title.dart';
import 'package:pml_ship/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:pml_ship/widgets/app_bar/custom_app_bar.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/widgets/custom_elevated_button.dart';
import 'package:pml_ship/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class UpdateEmailScreen extends StatelessWidget {
  UpdateEmailScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.v),
          children: [
            SizedBox(
              height: 80,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: 36,
                    child: Image.asset(
                      'assets/images/img_circled_envelope.png',
                      height: 37,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  SizedBox(
                    height: 29.v,
                    width: 57.h,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgUserGray800,
                          height: 29.v,
                          width: 57.h,
                          marginBottom: 10.v,
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 4.h),
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KeamananAkunScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 24.h,
                        height: 24.v,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.v),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Keamanan Akun",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 9.v),
            SizedBox(height: 7.v),
            Positioned(
              left: 36,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF9DB6D4),
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/img_circled_envelope.png',
                  height: 37,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(height: 7.v),
            Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: Text(
                "Update Email",
                style: theme.textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 7.v),
            Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: const Text(
                "Apabila ada email lain yang mau dipakai",
                style: TextStyle(
                  color: Colors.black, // Warna teks hitam
                  fontSize: 10, // Ukuran teks 10
                ),
              ),
            ),
            SizedBox(height: 8.v),
            Divider(color: appTheme.teal50),
            SizedBox(height: 23.v),
            Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: Text(
                "Email terdaftar",
                style: theme.textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 13.v),
            Padding(
              padding: EdgeInsets.only(left: 31.h, right: 44.h),
              child: CustomTextFormField(
                controller: emailController,
                hintText: "qorywiljanova@gmail.com",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
              ),
            ),
            const Spacer(),
            SizedBox(height: 75.v),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  onTapTxtVerifikasi(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: CustomElevatedButton(
                    height: 19.v,
                    width: 76.h,
                    text: "Verifikasi",
                    color: const Color(0xFF4682B4),
                    buttonTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EmailSudahDiverifikasiScreen(),
                        ),
                      );
                    },
                    onTap: () {},
                    buttonTextstyle: null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
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

void onTapTxtVerifikasi(BuildContext context) {
  // Implement your logic here
}
