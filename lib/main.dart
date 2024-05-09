import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/datasource/auth_remote_datasource.dart';
import 'package:pml_ship/presentation/auth/bloc/login/login_bloc.dart';

import 'presentation/auth/new_password_set_page.dart';
import 'presentation/auth/otp_input_reset_password_page.dart';
import 'presentation/auth/recover_password_page.dart';
import 'presentation/auth/registerpage.dart';
import 'presentation/auth/registration_process_waiting.dart';
import 'presentation/auth/set_new_password.dart';
import 'presentation/auth/sign_in_page.dart';
import 'presentation/input_shipper_consignee_data_page.dart';
import 'presentation/main_page/home/document_list/document_list_page.dart';
import 'presentation/main_page/home/order/planning_order_mitigasi_screen.dart';
import 'presentation/main_page/home/order/request_order_page.dart';
import 'presentation/main_page/home/risk_mitigation/risk_mitigation_page.dart';
import 'presentation/main_page/home/track_vessel/track_vessel_page.dart';
import 'presentation/main_page/main_page.dart';
import 'presentation/main_page/profile/account/edit_company_profile_page.dart';
import 'presentation/main_page/profile/account/edit_personal_profile_page.dart';
import 'presentation/main_page/profile/general/alamat_pelabuhan_screen.dart';
import 'presentation/main_page/profile/general/contact_us_page.dart';
import 'presentation/main_page/profile/general/frequently_asked_question_page.dart';
import 'presentation/main_page/profile/general/how_to_pay_page.dart';
import 'presentation/main_page/profile/settings/notification_settings_page.dart';
import 'presentation/main_page/profile/settings/security_page.dart';
import 'presentation/main_page/profile/settings/where_you_are_logged_in_page.dart';
import 'presentation/order_summary_page.dart';
import 'presentation/splash_page.dart';

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

    return BlocProvider(
      create: (context) => LoginBloc(AuthRemoteDatasource()),
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => Registerpage(),
          '/home': (context) => const MainPage(),
          '/edit-personal-profile': (context) =>
              const EditPersonalProfilePage(),
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
      ),
    );
  }
}
