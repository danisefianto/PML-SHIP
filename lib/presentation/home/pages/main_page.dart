import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../history/bloc/history_order/history_order_bloc.dart';
import '../../history/pages/history_page.dart';
import '../../profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
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
            onTap: (value) => setState(
              () {
                _selectedIndex = value;

                if (_selectedIndex == 0) {
                  context.read<GetAuthenticatedUserBloc>().add(
                      const GetAuthenticatedUserEvent.getAuthenticatedUser());
                } else if (_selectedIndex == 1) {
                  context
                      .read<HistoryOrderBloc>()
                      .add(const HistoryOrderEvent.getAllPendingOrders());
                } else {
                  context.read<GetAuthenticatedUserBloc>().add(
                      const GetAuthenticatedUserEvent.getAuthenticatedUser());
                }
              },
            ),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(color: AppColors.gray1),
            selectedIconTheme: const IconThemeData(color: AppColors.black),
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
