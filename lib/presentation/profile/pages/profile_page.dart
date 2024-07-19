import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pml_ship/presentation/profile/pages/general/contact_us_page.dart';
import 'package:pml_ship/presentation/profile/pages/general/frequently_asked_question_page.dart';
import 'package:pml_ship/presentation/profile/pages/security_page.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/sign_in_page.dart';
import '../bloc/currency/currency_bloc.dart';
import '../bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';
import 'edit_personal_and_company_profile_page.dart';
import 'general/alamat_pelabuhan_screen.dart';
import 'general/how_to_pay_page.dart';
import 'notification_settings_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context
        .read<GetAuthenticatedUserBloc>()
        .add(const GetAuthenticatedUserEvent.getAuthenticatedUser());

    context.read<CurrencyBloc>().add(const CurrencyEvent.fetchRates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAuthenticatedUserBloc, GetAuthenticatedUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (profile) {
            return ListView(children: [
              ProfileHeader(profile: profile),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<CurrencyBloc, CurrencyState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const Center(child: Text('Error'));
                          },
                          loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                          success: (rates) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Currency Rate',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  '1 USD = ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(double.parse(rates.data.rate))}',
                                  style: primaryTextStyle.copyWith(
                                      fontSize: 16.0, fontWeight: semiBold),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const SpaceHeight(30),
                    Text(
                      'Account',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                      ),
                    ),
                    ProfileMenuItem(
                      title: 'Edit Personal and Company Profile',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditPersonalAndCompanyProfilePage(
                                    profile: profile,
                                  )),
                        );
                      },
                    ),
                    const SpaceHeight(15),
                    Text(
                      'Settings',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                      ),
                    ),
                    ProfileMenuItem(
                      title: 'Security',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecurityPage()),
                        );
                      },
                    ),
                    const SpaceHeight(5),
                    ProfileMenuItem(
                      title: 'Notification Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSetting()),
                        );
                      },
                    ),
                    const SpaceHeight(15),
                    Text(
                      'General',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16.0,
                      ),
                    ),
                    const ProfileMenuItem(title: 'Your Orders'),
                    const SpaceHeight(15),
                    ProfileMenuItem(
                      title: 'Alamat Pelabuhan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AlamatPelabuhanScreen()),
                        );
                      },
                    ),
                    const SpaceHeight(15),
                    ProfileMenuItem(
                      title: 'How to Pay?',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HowToPayPage()),
                        );
                      },
                    ),
                    const SpaceHeight(15),
                    ProfileMenuItem(
                      title: 'Help',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FAQPage()),
                        );
                      },
                    ),
                    const SpaceHeight(15),
                    ProfileMenuItem(
                      title: 'Contact Us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContactUsPage()),
                        );
                      },
                    ),
                    const SpaceHeight(30),
                    BlocListener<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        state.maybeMap(
                          orElse: () {},
                          error: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          success: (value) {
                            AuthLocalDataSource().removeAuthData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Logout success'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                            );
                          },
                        );
                      },
                      child: Button.filled(
                        onPressed: () {
                          context
                              .read<LogoutBloc>()
                              .add(const LogoutEvent.logout());
                        },
                        label: 'Logout',
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          },
        );
      },
    );
  }
}
