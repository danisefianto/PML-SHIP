import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// Data Source
import 'core/core.dart';
import 'data/datasource/auth_local_datasource.dart';
import 'data/datasource/auth_remote_datasource.dart';
import 'data/datasource/currency_remote_datasource.dart';
import 'data/datasource/document_remote_datasource.dart';
import 'data/datasource/history_remote_datasource.dart';
import 'data/datasource/order_remote_datasource.dart';
import 'data/datasource/payment_remote_datasource.dart';
import 'data/models/response/user_response_model.dart';
// Bloc
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/auth/pages/new_password_set_page.dart';
import 'presentation/auth/pages/otp_input_reset_password_page.dart';
import 'presentation/auth/pages/recover_password_page.dart';
import 'presentation/auth/pages/register_page.dart';
import 'presentation/auth/pages/registration_process_waiting.dart';
import 'presentation/auth/pages/set_new_password.dart';
import 'presentation/auth/pages/sign_in_page.dart';
import 'presentation/history/bloc/canceledOrdersData/canceled_orders_data_bloc.dart';
import 'presentation/history/bloc/completedOrdersData/completed_orders_data_bloc.dart';
import 'presentation/history/bloc/onShippingOrdersData/on_shipping_orders_data_bloc.dart';
import 'presentation/history/bloc/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import 'presentation/history/bloc/pendingOrdersData/pending_orders_data_bloc.dart';
import 'presentation/history/bloc/rejectedOrdersData/rejected_orders_data_bloc.dart';
import 'presentation/history/pages/choose_payment_plan_page.dart';
import 'presentation/home/bloc/addPayment/add_payment_bloc.dart';
import 'presentation/history/bloc/documentData/document_data_bloc.dart';
import 'presentation/home/bloc/order/addConference/add_conference_bloc.dart';
import 'presentation/home/bloc/order/newCheckQuotation/new_check_quotation_bloc.dart';
import 'presentation/home/bloc/order/newOrder/new_order_bloc.dart';
import 'presentation/home/bloc/paymentOptions/payment_options_bloc.dart';
import 'presentation/home/bloc/port/port_bloc.dart';
import 'presentation/home/bloc/summaryOrder/summary_order_bloc.dart';
import 'presentation/home/bloc/uploadPaymentProof/upload_payment_proof_bloc.dart';
import 'presentation/home/bloc/upload_document/upload_document_bloc.dart';
import 'presentation/home/bloc/weather/weather_bloc.dart';
import 'presentation/home/pages/main_page.dart';
import 'presentation/home/pages/order/add_conference_page.dart';
import 'presentation/home/pages/order/add_shipper_consignee_data_page.dart';
import 'presentation/home/pages/order/order_port_page.dart';
import 'presentation/home/pages/order/order_process_waiting.dart';
import 'presentation/home/pages/order/order_summary_page.dart';
import 'presentation/home/pages/order/quotation_and_weather_risk_mitigation_page.dart';
import 'presentation/home/pages/risk_mitigation/risk_mitigation_page.dart';
import 'presentation/home/pages/tracking_order_screen.dart';
import 'presentation/onboarding/pages/onboarding_page.dart';
import 'presentation/profile/bloc/currency/currency_bloc.dart';
import 'presentation/profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import 'presentation/profile/bloc/update_user_data/update_user_data_bloc.dart';
import 'presentation/profile/pages/edit_personal_and_company_profile_page.dart';
import 'presentation/profile/pages/general/alamat_pelabuhan_screen.dart';
import 'presentation/profile/pages/general/contact_us_page.dart';
import 'presentation/profile/pages/general/frequently_asked_question_page.dart';
import 'presentation/profile/pages/general/how_to_pay_page.dart';
import 'presentation/profile/pages/notification_settings_page.dart';
import 'presentation/profile/pages/security_page.dart';
import 'presentation/profile/pages/where_you_are_logged_in_page.dart';

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
          create: (context) => GetAuthenticatedUserBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UpdateUserDataBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CurrencyBloc(CurrencyRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => PortBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => SummaryOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddConferenceBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UploadDocumentBloc(DocumentRemoteDatasource()),
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
        BlocProvider(
          create: (context) => DocumentDataBloc(DocumentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => PaymentOptionsBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AddPaymentBloc(PaymentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              UploadPaymentProofBloc(PaymentRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'PML SHIP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: Colors.white,
          dividerTheme: const DividerThemeData(color: AppColors.divider),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.blue,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        ),
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
            return AddConferencePage(
              transactionIdMessage: transactionId,
            );
          },
          AppRoutes.editPersonalAndCompanyProfile: (context) {
            final user =
                ModalRoute.of(context)!.settings.arguments as UserResponseModel;
            return EditPersonalAndCompanyProfilePage(
              profile: user,
            );
          },
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
          // AppRoutes.documentList: (context) {
          //   final args = ModalRoute.of(context)!.settings.arguments;
          //   return DocumentListPage(
          //     transactionId: args as String,
          //   );
          // },
          AppRoutes.trackVessel: (context) => TrackingOneScreen(),
          AppRoutes.registrationProcessWaiting: (context) =>
              const RegistrationProcessWaitingPage(),
          AppRoutes.orderProcessWaiting: (context) =>
              const OrderProcessWaitingPage(),
          AppRoutes.choosePayment: (context) {
            final args = ModalRoute.of(context)!.settings.arguments;
            return ChoosePaymentPlanPage(
              transactionId: args as String,
            );
          },
        },
      ),
    );
  }
}
