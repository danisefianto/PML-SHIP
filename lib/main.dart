import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/order/newOrder/new_order_bloc.dart';

// Data Source

import 'core/core.dart';
import 'data/datasource/auth_local_datasource.dart';
import 'data/datasource/auth_remote_datasource.dart';
import 'data/datasource/currency_remote_datasource.dart';
import 'data/datasource/history_remote_datasource.dart';
import 'data/datasource/order_remote_datasource.dart';
import 'data/datasource/update_document_remote_datasource.dart';
import 'data/datasource/user_remote_datasource.dart';
// Bloc
import 'presentation/bloc/auth/login/login_bloc.dart';
import 'presentation/bloc/auth/logout/logout_bloc.dart';
import 'presentation/bloc/currency/currency_bloc.dart';
import 'presentation/bloc/history/canceledOrdersData/canceled_orders_data_bloc.dart';
import 'presentation/bloc/history/completedOrdersData/completed_orders_data_bloc.dart';
import 'presentation/bloc/history/onShippingOrdersData/on_shipping_orders_data_bloc.dart';
import 'presentation/bloc/history/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import 'presentation/bloc/history/pendingOrdersData/pending_orders_data_bloc.dart';
import 'presentation/bloc/history/rejectedOrdersData/rejected_orders_data_bloc.dart';
import 'presentation/bloc/order/addConference/add_conference_bloc.dart';
import 'presentation/bloc/order/addShipperConsignee/add_shipper_consignee_bloc.dart';
import 'presentation/bloc/order/checkQuotation/check_quotation_bloc.dart';
import 'presentation/bloc/order/newCheckQuotation/new_check_quotation_bloc.dart';
import 'presentation/bloc/order/orderPort/order_port_bloc.dart';
import 'presentation/bloc/order/placeQuotation/place_quotation_bloc.dart';
import 'presentation/bloc/port/port_bloc.dart';
import 'presentation/bloc/profile/profile_bloc.dart';
import 'presentation/bloc/register/register_bloc.dart';
import 'presentation/bloc/summaryOrder/summary_order_bloc.dart';
import 'presentation/bloc/update_user_data/update_user_data_bloc.dart';
import 'presentation/bloc/upload_document/upload_document_bloc.dart';
import 'presentation/bloc/weather/weather_bloc.dart';
import 'presentation/pages/auth/new_password_set_page.dart';
import 'presentation/pages/auth/otp_input_reset_password_page.dart';
import 'presentation/pages/auth/recover_password_page.dart';
import 'presentation/pages/auth/register_page.dart';
import 'presentation/pages/auth/registration_process_waiting.dart';
import 'presentation/pages/auth/set_new_password.dart';
import 'presentation/pages/auth/sign_in_page.dart';
import 'presentation/pages/document_list/document_list_page.dart';
import 'presentation/pages/general/alamat_pelabuhan_screen.dart';
import 'presentation/pages/general/contact_us_page.dart';
import 'presentation/pages/general/frequently_asked_question_page.dart';
import 'presentation/pages/general/how_to_pay_page.dart';
import 'presentation/pages/main_page/main_page.dart';
import 'presentation/pages/onboarding/onboarding_page.dart';
import 'presentation/pages/order/add_shipper_consignee_data_page.dart';
import 'presentation/pages/order/conference_page.dart';
import 'presentation/pages/order/order_port_page.dart';
import 'presentation/pages/order/order_process_waiting.dart';
import 'presentation/pages/order/order_summary_page.dart';
import 'presentation/pages/order/quotation_and_weather_risk_mitigation_page.dart';
import 'presentation/pages/profile/edit_personal_and_company_profile_page.dart';
import 'presentation/pages/risk_mitigation/risk_mitigation_page.dart';
import 'presentation/pages/settings/notification_settings_page.dart';
import 'presentation/pages/settings/security_page.dart';
import 'presentation/pages/settings/where_you_are_logged_in_page.dart';
import 'presentation/pages/track_vessel/tracking_order_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          create: (context) =>
              UploadDocumentBloc(UpdateDocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PendingOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PaymentPendingOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              OnShippingOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CompletedOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CanceledOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              RejectedOrdersDataBloc(HistoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => NewCheckQuotationBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => NewOrderBloc(OrderRemoteDatasource()),
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
                log('snapshot.data: ${snapshot.data}');
                return const MainPage();
              } else {
                log('snapshot.data: ${snapshot.data}');

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
        routes: {
          // '/splash': (context) => const SplashPage(),
          AppRoutes.signIn: (context) => const SignInPage(),
          AppRoutes.signUp: (context) => const Registerpage(),
          '/home': (context) => const MainPage(),
          AppRoutes.orderPort: (context) => const OrderPortPage(),
          AppRoutes.orderSummary: (context) {
            String transactionId =
                ModalRoute.of(context)!.settings.arguments as String;
            return OrderSummaryPage(
              transactionIdMessage: transactionId,
            );
          },

          AppRoutes.quotationAndWeatherRiskMitigation: (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>?;

            if (args != null &&
                args.containsKey('portOfLoadingId') &&
                args.containsKey('portOfDischargeId') &&
                args.containsKey('dateOfLoading') &&
                args.containsKey('cargoDescription') &&
                args.containsKey('cargoWeight') &&
                args['portOfLoadingId'] != null &&
                args['portOfDischargeId'] != null &&
                args['dateOfLoading'] != null &&
                args['cargoDescription'] != null &&
                args['cargoWeight'] != null) {
              final portOfLoadingId = args['portOfLoadingId'] as int;
              final portOfDischargeId = args['portOfDischargeId'] as int;
              final dateOfLoading = args['dateOfLoading'] as DateTime;
              final cargoDescription = args['cargoDescription'] as String;
              final cargoWeight = args['cargoWeight'] as String;

              return QuotationAndWeatherRiskMitigationPage(
                portOfLoadingId: portOfLoadingId,
                portOfDischargeId: portOfDischargeId,
                dateOfLoading: dateOfLoading,
                cargoDescription: cargoDescription,
                cargoWeight: cargoWeight,
              );
            }

            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Invalid arguments'),
                    Button.filled(
                      width: 220,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: 'Back to previous page',
                    )
                  ],
                ),
              ),
            );
          },

          AppRoutes.addShipperConsigneeData: (context) {
            final args = ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>?;

            if (args != null &&
                args.containsKey('portOfLoadingId') &&
                args.containsKey('portOfDischargeId') &&
                args.containsKey('vesselId') &&
                args.containsKey('dateOfLoading') &&
                args.containsKey('dateOfDischarge') &&
                args.containsKey('cargoDescription') &&
                args.containsKey('cargoWeight') &&
                args.containsKey('shippingCost') &&
                args.containsKey('handlingCost') &&
                args.containsKey('biayaParkirPelabuhan') &&
                args['portOfLoadingId'] != null &&
                args['portOfDischargeId'] != null &&
                args['vesselId'] != null &&
                args['dateOfLoading'] != null &&
                args['dateOfDischarge'] != null &&
                args['cargoDescription'] != null &&
                args['cargoWeight'] != null &&
                args['shippingCost'] != null &&
                args['handlingCost'] != null &&
                args['biayaParkirPelabuhan'] != null) {
              final portOfLoadingId = args['portOfLoadingId'] as int;
              final portOfDischargeId = args['portOfDischargeId'] as int;
              final vesselId = args['vesselId'] as int;
              final dateOfLoading = args['dateOfLoading'] as DateTime;
              final dateOfDischarge = args['dateOfDischarge'] as DateTime;
              final cargoDescription = args['cargoDescription'] as String;
              final cargoWeight = args['cargoWeight'] as String;
              final shippingCost = args['shippingCost'] as int;
              final handlingCost = args['handlingCost'] as int;
              final biayaParkirPelabuhan = args['biayaParkirPelabuhan'] as int;

              return AddShipperConsigneeDataPage(
                portOfLoadingId: portOfLoadingId,
                portOfDischargeId: portOfDischargeId,
                dateOfLoading: dateOfLoading,
                cargoDescription: cargoDescription,
                cargoWeight: cargoWeight,
                vesselId: vesselId,
                dateOfDischarge: dateOfDischarge,
                shippingCost: shippingCost,
                handlingCost: handlingCost,
                biayaParkirPelabuhan: biayaParkirPelabuhan,
              );
            }
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Invalid arguments'),
                    Button.filled(
                      width: 220,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: 'Back to previous page',
                    )
                  ],
                ),
              ),
            );
          },
          AppRoutes.addConference: (context) {
            String transactionId =
                ModalRoute.of(context)!.settings.arguments as String;
            return ConferencePage(
              transactionIdMessage: transactionId,
            );
          },
          AppRoutes.editPersonalAndCompanyProfile: (context) =>
              const EditPersonalAndCompanyProfilePage(),
          AppRoutes.howToPay: (context) => const HowToPayPage(),
          AppRoutes.security: (context) => const SecurityPage(),
          AppRoutes.faq: (context) => const FAQPage(),
          AppRoutes.portLocation: (context) => const AlamatPelabuhanScreen(),
          AppRoutes.recoverPassword: (context) => const RecoverPasswordPage(),
          AppRoutes.otpInputPasswordReset: (context) =>
              const OtpInputPasswordResetPage(),
          AppRoutes.setNewPassword: (context) => const SetNewPasswordPage(),
          AppRoutes.newPasswordSet: (context) => const NewPasswordSetPage(),
          AppRoutes.whereYouAreLoggedIn: (context) =>
              const WhereYouAreLoggedIn(),
          AppRoutes.riskMitigation: (context) => const RiskMitigationScreen(),
          AppRoutes.notificationSettings: (context) =>
              const NotificationSetting(),
          AppRoutes.contactUs: (context) => const ContactUsPage(),
          AppRoutes.documentList: (context) => const DocumentListPage(),
          AppRoutes.trackVessel: (context) => TrackingOneScreen(),
          AppRoutes.registrationProcessWaiting: (context) =>
              const RegistrationProcessWaitingPage(),
          AppRoutes.orderProcessWaiting: (context) =>
              const OrderProcessWaitingPage(),
        },
      ),
    );
  }
}
