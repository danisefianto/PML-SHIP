import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/new_check_quotation_request_model.dart';
import '../../../../data/models/request/weather_request_model.dart';
import '../../bloc/order/newCheckQuotation/new_check_quotation_bloc.dart';
import '../../bloc/weather/weather_bloc.dart';
import '../../models/weather_code.dart';
import 'add_shipper_consignee_data_page.dart';

// TODO: Refactor supaya lebih mudah dibaca dan kode lebih bersih
class QuotationAndWeatherRiskMitigationPage extends StatefulWidget {
  final int portOfLoadingId;
  final int portOfDischargeId;
  final DateTime dateOfLoading;
  final String cargoDescription;
  final String cargoWeight;

  const QuotationAndWeatherRiskMitigationPage({
    super.key,
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.dateOfLoading,
    required this.cargoDescription,
    required this.cargoWeight,
  });

  @override
  State<QuotationAndWeatherRiskMitigationPage> createState() =>
      _QuotationAndWeatherRiskMitigationPageState();
}

class _QuotationAndWeatherRiskMitigationPageState
    extends State<QuotationAndWeatherRiskMitigationPage> {
  // State variable to store the selected route

  // ignore: prefer_typing_uninitialized_variables
  var selectedRoute;

  @override
  void initState() {
    super.initState();
    context.read<NewCheckQuotationBloc>().add(
          NewCheckQuotationEvent.checkQuotation(
            NewCheckQuotationRequestModel(
              portOfLoadingId: widget.portOfLoadingId,
              portOfDischargeId: widget.portOfDischargeId,
              dateOfLoading: widget.dateOfLoading,
              cargoDescription: widget.cargoDescription,
              cargoWeight: widget.cargoWeight,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Quotation'),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: BlocBuilder<NewCheckQuotationBloc, NewCheckQuotationState>(
            builder: (context, state) {
              return state.maybeWhen(
                error: (message) {
                  return Center(
                    child: Text('Error: $message',
                        style: const TextStyle(color: Colors.red)),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (routes) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 24.0),
                    separatorBuilder: (context, index) => const SpaceHeight(16),
                    itemCount: routes.data.length,
                    itemBuilder: (context, index) => GestureDetector(
                      // Inside the GestureDetector onTap handler in QuotationAndWeatherRiskMitigationPage
                      onTap: () {
                        // Handle item tap
                        setState(() {
                          selectedRoute = routes.data[index];
                        });
                        final weatherRequestPortOfLoading = WeatherRequestModel(
                          latitude: [
                            selectedRoute.portOfLoading.latitude,
                            selectedRoute.portOfDischarge.latitude
                          ],
                          longitude: [
                            selectedRoute.portOfLoading.longitude,
                            selectedRoute.portOfDischarge.longitude
                          ],
                          daily: [
                            'weather_code',
                            'temperature_2m_max',
                            'temperature_2m_min',
                            'wind_speed_10m_max',
                            'wind_direction_10m_dominant'
                          ],
                          timezone: 'Asia/Bangkok',
                          startDate: DateFormat("yyyy-MM-dd")
                              .format(widget.dateOfLoading),
                          endDate: DateFormat("yyyy-MM-dd")
                              .format(selectedRoute.estimatedDateOfDischarge),
                        );

                        context.read<WeatherBloc>().add(
                              WeatherEvent.fetchWeather(
                                  weatherRequestPortOfLoading),
                            );
                      },

                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              routes.data[index].vesselName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${routes.data[index].portOfLoading.name} - ${routes.data[index].portOfDischarge.name}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi perjalanan: ${routes.data[index].dayEstimation} hari',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi biaya pengiriman: ${routes.data[index].cost.shippingCost.currencyEYDFormatRp}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi biaya penanganan: ${routes.data[index].cost.handlingCost.currencyEYDFormatRp}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi biaya parkir pelabuhan: ${routes.data[index].cost.biayaParkirPelabuhan.currencyEYDFormatRp}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                orElse: () {
                  return const Center(child: Text('No data available'));
                },
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selectedRoute != null)
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      error: (message) {
                        return Center(
                          child: Text('Error: $message',
                              style: const TextStyle(color: Colors.red)),
                        );
                      },
                      success: (weatherResponse) {
                        if (weatherResponse.locations.isEmpty) {
                          return const Center(
                              child: Text('No weather data available'));
                        }

                        final firstLocation = weatherResponse.locations[0];
                        final secondLocation =
                            weatherResponse.locations.length > 1
                                ? weatherResponse.locations[1]
                                : null;

                        final firstDayIndex =
                            firstLocation.daily.time.indexWhere((date) {
                          return date.toIso8601String().startsWith(
                              DateFormat("yyyy-MM-dd")
                                  .format(widget.dateOfLoading));
                        });
                        final lastDayIndex = secondLocation != null
                            ? secondLocation.daily.time.indexWhere((date) {
                                return date.toIso8601String().startsWith(
                                    DateFormat("yyyy-MM-dd").format(
                                        selectedRoute
                                            .estimatedDateOfDischarge));
                              })
                            : -1;
                        weatherCodeObject(int code) {
                          return weatherCodes.firstWhere(
                            (wc) {
                              return wc.code == code;
                            },
                            orElse: () => WeatherCode(
                              code: -1,
                              indonesianDescription: 'Tidak diketahui',
                              englishDescription: 'Unknown',
                              icon: Assets.icon.iconImageNotFound.image(
                                width: 40,
                              ), // Fallback image
                            ),
                          );
                        }

                        // TODO: Change to BottomSheet
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (firstDayIndex != -1) ...[
                              // First Location Weather
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // Port of Loading:
                                          '${selectedRoute.portOfLoading.name}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(firstLocation.daily.time.first
                                            .toFormattedInternationalLongDate()),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${firstLocation.daily.temperature2MMin.first} °C/${firstLocation.daily.temperature2MMax.first} °C',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  weatherCodeObject(
                                                          firstLocation
                                                              .daily
                                                              .weatherCode
                                                              .first)
                                                      .englishDescription,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            weatherCodeObject(firstLocation
                                                    .daily.weatherCode.first)
                                                .icon
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Assets.icon.weather.id.pm.anginPm
                                                .image(height: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text('Wind',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    )),
                                                Text(
                                                  '${firstLocation.daily.windSpeed10MMax.first} km/h',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.near_me,
                                              size: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Wind from',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  '${firstLocation.daily.windDirection10MDominant.first} degree',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                            const Divider(),
                            if (secondLocation != null &&
                                lastDayIndex != -1) ...[
                              // Second Location Weather
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // Port of Discharge:
                                          '${selectedRoute.portOfDischarge.name}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(firstLocation.daily.time.last
                                            .toFormattedInternationalLongDate()),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${firstLocation.daily.temperature2MMin.last} °C/${firstLocation.daily.temperature2MMax.last} °C',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  weatherCodeObject(
                                                          firstLocation.daily
                                                              .weatherCode.last)
                                                      .englishDescription,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            weatherCodeObject(firstLocation
                                                    .daily.weatherCode.last)
                                                .icon
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Assets.icon.weather.id.pm.anginPm
                                                .image(height: 20),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text('Wind',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    )),
                                                Text(
                                                  '${firstLocation.daily.windSpeed10MMax.last} km/h',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SpaceHeight(10),
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                              Icons.near_me,
                                              size: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Wind from',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                Text(
                                                  '${firstLocation.daily.windDirection10MDominant.last} degree',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
              const SpaceHeight(16),
              Button.outlined(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data ditambahkan'),
                      backgroundColor: AppColors.green,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddShipperConsigneeDataPage(
                        portOfLoadingId: widget.portOfLoadingId,
                        portOfDischargeId: widget.portOfDischargeId,
                        vesselId: selectedRoute.vesselId,
                        dateOfLoading: widget.dateOfLoading,
                        dateOfDischarge: DateTime.parse(DateFormat("yyyy-MM-dd")
                            .format(selectedRoute.estimatedDateOfDischarge)),
                        cargoDescription: widget.cargoDescription,
                        cargoWeight: widget.cargoWeight,
                        shippingCost: selectedRoute.cost.shippingCost,
                        handlingCost: selectedRoute.cost.handlingCost,
                        biayaParkirPelabuhan:
                            selectedRoute.cost.biayaParkirPelabuhan,
                      ),
                    ),
                  );
                },
                label: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
