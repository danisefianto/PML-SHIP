import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Data Source

import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/data/datasource/auth_remote_datasource.dart';
import 'package:pml_ship/data/datasource/currency_remote_datasource.dart';
import 'package:pml_ship/data/datasource/history_remote_datasource.dart';
import 'package:pml_ship/data/datasource/user_remote_datasource.dart';
// Bloc
import 'package:pml_ship/presentation/auth/bloc/login/login_bloc.dart';
import 'package:pml_ship/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:pml_ship/presentation/auth/bloc/register/register_bloc.dart';
import 'package:pml_ship/presentation/auth/pages/new_password_set_page.dart';
import 'package:pml_ship/presentation/auth/pages/otp_input_reset_password_page.dart';
import 'package:pml_ship/presentation/auth/pages/recover_password_page.dart';
import 'package:pml_ship/presentation/auth/pages/register_page.dart';
import 'package:pml_ship/presentation/auth/pages/registration_process_waiting.dart';
import 'package:pml_ship/presentation/auth/pages/set_new_password.dart';
import 'package:pml_ship/presentation/auth/pages/sign_in_page.dart';
import 'package:pml_ship/presentation/document_list/document_list_page.dart';
import 'package:pml_ship/presentation/general/alamat_pelabuhan_screen.dart';
import 'package:pml_ship/presentation/general/contact_us_page.dart';
import 'package:pml_ship/presentation/general/frequently_asked_question_page.dart';
import 'package:pml_ship/presentation/general/how_to_pay_page.dart';
import 'package:pml_ship/presentation/history/bloc/history/history_bloc.dart';
import 'package:pml_ship/presentation/main_page/main_page.dart';
import 'package:pml_ship/presentation/onboarding/pages/onboarding_page.dart';
import 'package:pml_ship/presentation/order/bloc/addShipperConsignee/add_shipper_consignee_bloc.dart';
import 'package:pml_ship/presentation/order/bloc/checkQuotation/check_quotation_bloc.dart';
import 'package:pml_ship/presentation/order/bloc/orderPort/order_port_bloc.dart';
import 'package:pml_ship/presentation/order/bloc/port/port_bloc.dart';
import 'package:pml_ship/presentation/order/bloc/summaryOrder/summary_order_bloc.dart';
import 'package:pml_ship/presentation/order/bloc/weather/weather_bloc.dart';
import 'package:pml_ship/presentation/profile/bloc/currency/currency_bloc.dart';
import 'package:pml_ship/presentation/profile/bloc/profile/profile_bloc.dart';
import 'package:pml_ship/presentation/profile/bloc/update_user_data/update_user_data_bloc.dart';
import 'package:pml_ship/presentation/profile/edit_personal_and_company_profile_page.dart';
import 'package:pml_ship/presentation/risk_mitigation/risk_mitigation_page.dart';
import 'package:pml_ship/presentation/settings/notification_settings_page.dart';
import 'package:pml_ship/presentation/settings/security_page.dart';
import 'package:pml_ship/presentation/settings/where_you_are_logged_in_page.dart';
// Presentation
import 'package:pml_ship/presentation/track_vessel/tracking_order_screen.dart';

import 'data/datasource/order_remote_datasource.dart';
import 'presentation/order/bloc/addConference/add_conference_bloc.dart';
import 'presentation/order/bloc/placeQuotation/place_quotation_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: ShowPortPage(),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UpdateUserDataBloc(UserRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CurrencyBloc(CurrencyRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => PortBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => OrderPortBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckQuotationBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PlaceQuotationBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddShipperConsigneeBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SummaryOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddConferenceBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(HistoryRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        home: FutureBuilder<bool>(
          future: AuthLocalDataSource().isAuthDataExists(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const MainPage();
              } else {
                // Navigator.pushNamed(context, '/splash');
                // return const SplashPage();
                return const OnboardingPage();
              }
            }
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          },
        ),
        // TODO: Change routes from namedRoutes to onGenerateRoute
        // https://docs.flutter.dev/ui/navigation#limitations
        routes: {
          // '/splash': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const Registerpage(),
          '/home': (context) => const MainPage(),
          // '/home': (context) => const ConferencePage(),
          '/edit-personal-and-company-profile': (context) =>
              const EditPersonalAndCompanyProfilePage(),
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
          '/contact-us': (context) => const ContactUsPage(),
          '/list-document': (context) => const DocumentListPage(),
          '/track-vessel': (context) => TrackingOneScreen(),
          '/registration-process-waiting': (context) =>
              const RegistrationProcessWaitingPage(),
        },
      ),
    );
  }
}
