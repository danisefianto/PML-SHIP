import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import 'order/order_port_page.dart';
import 'risk_mitigation/risk_mitigation_page.dart';
import 'tracking_order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context
        .read<GetAuthenticatedUserBloc>()
        .add(const GetAuthenticatedUserEvent.getAuthenticatedUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget customDataCustomer() {
      return Container(
        padding: const EdgeInsets.only(top: 30.0),
        // Contain all of this part into one row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // First Row
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderPortPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: const Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Order'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RiskMitigationPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: const Icon(
                          Icons.warning,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Risk Mitigation'),
                    ],
                  ),
                ),
              ],
            ),
            // Second Column
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackingOrderPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: const Icon(
                          Icons.location_pin,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Track Vessel'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   AppRoutes.documentList,
                    // );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff9DB6D4),
                        ),
                        child: const Icon(
                          Icons.description,
                          size: 30,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text('Document List'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 30.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(Assets.image.imageProfileExample.path),
                  radius: 30.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      BlocBuilder<GetAuthenticatedUserBloc,
                          GetAuthenticatedUserState>(
                        builder: (context, state) {
                          String? name = '';
                          state.maybeWhen(
                            orElse: () {},
                            loaded: (user) {
                              name = user.data?.user!.name!;
                            },
                          );
                          return Text(
                            '$name',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Assets.image.ship.imageShipPatriaAndromeda1.image(height: 200),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),

          customDataCustomer(),

          // GestureDetector(
          //   onTap: () {
          //     // Navigator.pushNamed(context, '/list-document');
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             const UploadDocumentInOrderSummaryPage(),
          //       ),
          //     );
          //   },
          //   child: Column(
          //     children: [
          //       Container(
          //         width: 60.0,
          //         height: 60.0,
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Color(0xff9DB6D4),
          //         ),
          //         child: Icon(
          //           Icons.people,
          //           size: 30,
          //           color: primaryColor,
          //         ),
          //       ),
          //       const Text('Conference'),
          //     ],
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Row(
          children: [
            Text('WhatsApp Us!'),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.message),
          ],
        ),
      ),
    );
  }
}
