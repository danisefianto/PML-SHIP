import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/data/models/response/user_response_model.dart';
import 'package:pml_ship/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:pml_ship/presentation/profile/bloc/profile/profile_bloc.dart';

import '../../core/styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // UserResponseModel? user;
  FullUserData? user;
  @override
  void initState() {
    // Alternate way to get user data
    //    UserRemoteDatasource().getFullUserData().then((value) {
    //   setState(() {
    //     value.fold((l) {
    //       user = null;
    //     }, (r) {
    //       user = r;
    //     });
    //   });
    // });
    // Text('${user?.data.name ?? 'No Data'}')
    context.read<ProfileBloc>().add(const ProfileEvent.getFullUserData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        toolbarHeight: 124.0, //Didapat dari Figma
        titleSpacing:
            0, //Untuk menghilangkan padding dari leading (leading = biasanya berupa tombol back)
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/image_profile_example.jpg'),
                radius: 30.0,
              ),
              const SizedBox(
                width: 16,
              ),

              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: Text('Error'));
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    success: (user) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.data.name ?? '',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            user.data.email ?? '',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            user.data.companyName ?? '',
                            style: subtitleTextStyle.copyWith(
                                fontWeight: regular, fontSize: 16),
                          ),
                          Text(
                            'NPWP: ${user.data.companyNpwp ?? ''}',
                            style: subtitleTextStyle.copyWith(
                              fontWeight: regular,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              // ),
            ],
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: primaryTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 13.0,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return
          // Expanded(
          //   child:
          Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
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
              '1 Dollar = Rp16.241,00',
              style: primaryTextStyle.copyWith(
                  fontSize: 16.0, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            GestureDetector(
              child: menuItem('Edit Personal and Company Profile'),
              onTap: () => Navigator.pushNamed(
                  context, '/edit-personal-and-company-profile'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'Settings',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/security'),
                child: menuItem('Security')),
            GestureDetector(
              child: menuItem('Notification Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/notification-settings');
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16.0,
              ),
            ),
            menuItem('Your Orders'),
            GestureDetector(
              child: menuItem('Alamat Pelabuhan'),
              onTap: () => Navigator.pushNamed(context, '/port-location'),
            ),
            GestureDetector(
              child: menuItem('How to Pay?'),
              onTap: () => Navigator.pushNamed(context, '/how-to-pay'),
            ),
            GestureDetector(
              child: menuItem('Help'),
              onTap: () => Navigator.pushNamed(context, '/faq'),
            ),
            GestureDetector(
              child: menuItem('Contact Us'),
              onTap: () => Navigator.pushNamed(context, '/contact-us'),
            ),
            const SizedBox(
              height: 30.0,
            ),
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
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30.0),
                child: Button.filled(
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  label: 'Logout',
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        content(),
      ],
    );
  }
}
