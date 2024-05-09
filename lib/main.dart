import 'package:flutter/material.dart';

import 'presentation_old/auth/registration_process_waiting.dart';
import 'presentation_old/input_shipper_consignee_data_page.dart';
import 'presentation_old/main_page/home/order/halaman_invoice_screen.dart';

import 'presentation_old/main_page/home/order/request_order_page.dart';
import 'presentation_old/main_page/home/track_vessel/track_vessel_page.dart';

import 'presentation_old/main_page/home/document_list/document_list_page.dart';
import 'presentation_old/main_page/profile/settings/notification_settings_page.dart';
import 'presentation_old/auth/recover_password_page.dart';
import 'presentation_old/auth/otp_input_reset_password_page.dart';
import 'presentation_old/auth/new_password_set_page.dart';

import 'presentation_old/main_page/profile/settings/where_you_are_logged_in_page.dart';

import 'presentation_old/main_page/main_page.dart';

import 'presentation_old/main_page/profile/settings/security_page.dart';
import 'presentation_old/main_page/profile/general/alamat_pelabuhan_screen.dart';

import 'presentation_old/auth/set_new_password.dart';

import 'presentation_old/main_page/profile/general/how_to_pay_page.dart';

import 'presentation_old/auth/sign_in_page.dart';

import 'presentation_old/main_page/profile/account/edit_personal_profile_page.dart';
import 'presentation_old/main_page/profile/account/edit_company_profile_page.dart';
import 'presentation_old/main_page/home/risk_mitigation/risk_mitigation_page.dart';
import 'presentation_old/main_page/home/order/planning_order_mitigasi_screen.dart';
import 'presentation_old/order_summary_page.dart';
import 'presentation_old/splash_page.dart';
import 'presentation_old/auth/registerpage.dart';

import 'presentation_old/main_page/profile/general/frequently_asked_question_page.dart';
import 'presentation_old/main_page/profile/general/contact_us_page.dart';
import 'presentation_old/widgets/select_port_dropdown_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: TrackingOneScreen(),
    // );

    return MaterialApp(
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => Registerpage(),
        '/home': (context) => const MainPage(),
        '/edit-personal-profile': (context) => const EditPersonalProfilePage(),
        '/edit-company-profile': (context) => const EditCompanyProfilePage(),
        '/how-to-pay': (context) => const HowToPayPage(),
        '/security': (context) => const SecurityPage(),
        '/faq': (context) => const FAQPage(),
        '/port-location': (context) => const AlamatPelabuhanScreen(),
        '/recover-password': (context) => const RecoverPasswordPage(),
        '/otp-input-password-reset': (context) =>
            const OtpInputPasswordResetPage(),
        '/set-new-password': (context) => const SetNewPasswordPage(),
        '/new-password-set': (context) => const NewPasswordSetPage(),
        '/where-you-are-logged-in': (context) => const WhereYouAreLoggedIn(),
        '/risk-mitigation': (context) => const RiskMitigationScreen(),
        '/notification-settings': (context) => const NotificationSetting(),
        '/contact-us': (context) => ContactUsPage(),
        '/list-document': (context) => const DocumentListPage(),
        '/request-order': (context) => const RequestOrderPage(),
        '/track-vessel': (context) => const TrackVesselPage(),
        '/plan-order': (context) => PlanningOrderMitigasiScreen(),
        '/input-shipper-consignee-data': (context) =>
            InputShipperConsigneeDataPage(),
        '/order-summary': (context) => const OrderSummaryPage(),
        '/registration-process-waiting': (context) =>
            RegistrationProcessWaitingPage(),
      },
    );
  }
}
