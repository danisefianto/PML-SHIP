import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../auth/bloc/logout/logout_bloc.dart';
import '../../auth/pages/sign_in_page.dart';
import '../bloc/currency/currency_bloc.dart';
import '../bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_menu_item.dart';
import 'edit_personal_and_company_profile_page.dart';
import 'general/alamat_pelabuhan_screen.dart';
import 'general/contact_us_page.dart';
import 'general/frequently_asked_question_page.dart';
import 'general/how_to_pay_page.dart';
import 'notification_settings_page.dart';
import 'security_page.dart';

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
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
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
                                const Text(
                                  'Currency Rate',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  '1 USD = ${double.parse(rates.data.rate).currencyEYDFormatRp}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    const SpaceHeight(30),
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
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
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
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
                    const Text(
                      'General',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
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
                                backgroundColor: AppColors.green,
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
