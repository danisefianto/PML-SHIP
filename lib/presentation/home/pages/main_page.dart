import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../history/pages/history_page.dart';
import '../../profile/pages/profile_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final _widgets = [
    const HomePage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Main Page'),
      //   actions: [
      //     BlocListener<LogoutBloc, LogoutState>(
      //       listener: (context, state) {
      //         state.maybeWhen(
      //           orElse: () {},
      //           success: () => {
      //             AuthLocalDatasource().removeAuthData(),
      //             context.pushReplacement(const LoginPage()),
      //           },
      //           error: (message) {
      //             ScaffoldMessenger.of(context).showSnackBar(
      //               SnackBar(
      //                 content: Text(message),
      //                 backgroundColor: AppColors.red,
      //               ),
      //             );
      //           },
      //         );
      //       },
      //       child: IconButton(
      //         icon: const Icon(Icons.logout),
      //         onPressed: () {
      //           context.read<LogoutBloc>().add(const LogoutEvent.logout());
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgets,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: AppColors.primaryColor,
            highlightColor: AppColors.primaryColor,
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.primaryColor,
            useLegacyColorScheme: false,
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() => _selectedIndex = value),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(color: AppColors.gray1),
            selectedIconTheme: const IconThemeData(color: AppColors.black),
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),

                // Assets.icons.nav.home.svg(
                //   colorFilter: ColorFilter.mode(
                //     _selectedIndex == 0
                //         ? AppColors.primary
                //         : AppColors.navPlaceholder,
                //     BlendMode.srcIn,
                //   ),
                // ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),

                // Assets.icons.nav.order.svg(
                //   colorFilter: ColorFilter.mode(
                //     _selectedIndex == 2
                //         ? AppColors.primary
                //         : AppColors.navPlaceholder,
                //     BlendMode.srcIn,
                //   ),
                // ),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),

                // Assets.icons.nav.profile.svg(
                //   colorFilter: ColorFilter.mode(
                //     _selectedIndex == 3
                //         ? AppColors.primary
                //         : AppColors.navPlaceholder,
                //     BlendMode.srcIn,
                //   ),
                // ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
