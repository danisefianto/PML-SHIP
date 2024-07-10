import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/core.dart';
import '../../home/bloc/summaryOrder/summary_order_bloc.dart';
import '../../profile/bloc/get_authenticated_user/get_authenticated_user_bloc.dart';

class TrackVesselPage extends StatefulWidget {
  final String transactionId;

  const TrackVesselPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<TrackVesselPage> createState() => _TrackVesselPageState();
}

class _TrackVesselPageState extends State<TrackVesselPage> {
  // late GoogleMapController mapController;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  double? latitude;
  double? longitude;

  @override
  void initState() {
    context
        .read<SummaryOrderBloc>()
        .add(SummaryOrderEvent.getSummaryOrder(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // latitude = -5.2192;
    // longitude = 106.1305;

    // If the latitude and longitude are not null, create a LatLng object

    // Marker marker = Marker(
    //   markerId: const MarkerId('ship_location'),
    //   position: LatLng(latitude ?? 0, longitude ?? 0),
    // );
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
            builder: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (orderDetail) {
                  latitude = orderDetail.data!.vessel!.vesselLat;
                  longitude = orderDetail.data!.vessel!.vesselLon;
                  // LatLng shipLocation = ;
                },
              );
              return SizedBox(
                child: latitude == null
                    ? const Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(latitude ?? 0, longitude ?? 0),
                          zoom: 6.0,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('ship_location'),
                            position: LatLng(latitude ?? 0, longitude ?? 0),
                          )
                        },
                      ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 38.0, 0, 0),
            child: IconButton(
              onPressed: () {
                // context.pop();
                Navigator.pop(context);
                context.read<GetAuthenticatedUserBloc>().add(
                    const GetAuthenticatedUserEvent.getAuthenticatedUser());
              },
              icon: Assets.icon.backButton.svg(),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        child: ColoredBox(
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const Center(child: Text('No data found!'));
                  },
                  loading: () => const CircularProgressIndicator(),
                  success: (orderDetail) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 48.0,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                            child: Divider(
                              color: AppColors.gray2,
                              thickness: 4.0,
                            ),
                          ),
                        ),
                        const SpaceHeight(15.0),
                        const Text(
                          "Vessel Information",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SpaceHeight(22.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Vessel name'),
                            Text('${orderDetail.data!.vessel!.vesselName}'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Speed'),
                            Text(
                                '${orderDetail.data!.vessel!.vesselVtsSpeedKnot} knot'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Heading'),
                            Text(
                                '${orderDetail.data!.vessel!.vesselHeadingDegree}°'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Last updated at'),
                            Text(orderDetail.data!.vessel!.pmlLastUpdatedAt!
                                .toFormattedIndonesianShortDateAndUTC7Time()),
                          ],
                        ),
                        const SpaceHeight(10.0),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
