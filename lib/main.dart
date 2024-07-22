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
// Bloc
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/auth/bloc/register/register_bloc.dart';
import 'presentation/history/bloc/history_order/history_order_bloc.dart';
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
import 'presentation/onboarding/pages/onboarding_page.dart';
import 'presentation/profile/bloc/currency/currency_bloc.dart';
import 'presentation/profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import 'presentation/profile/bloc/update_user_data/update_user_data_bloc.dart';

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
          create: (context) => HistoryOrderBloc(HistoryRemoteDatasource()),
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
          scaffoldBackgroundColor: AppColors.primaryColor,
          dividerTheme: const DividerThemeData(color: AppColors.divider),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.blue,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(color: AppColors.primaryColor),
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
      ),
    );
  }
}
