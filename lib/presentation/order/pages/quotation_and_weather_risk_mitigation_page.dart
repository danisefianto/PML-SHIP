import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/request/quotation_request_model.dart';
import '../../../data/models/request/weather_request_model.dart';
import '../bloc/checkQuotation/check_quotation_bloc.dart';
import '../bloc/weather/weather_bloc.dart';
import '../models/weather_code.dart';
import 'add_shipper_consignee_data_page.dart';

class QuotationAndWeatherRiskMitigationPage extends StatefulWidget {
  final String transactionIdMessage;

  const QuotationAndWeatherRiskMitigationPage({
    super.key,
    required this.transactionIdMessage,
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
    context.read<CheckQuotationBloc>().add(
          CheckQuotationEvent.checkQuotation(
            QuotationRequestModel(transactionId: widget.transactionIdMessage),
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
                leading: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: BlocBuilder<CheckQuotationBloc, CheckQuotationState>(
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
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
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
                            selectedRoute.portOfLoadingLatitude,
                            selectedRoute.portOfDischargeLatitude
                          ],
                          longitude: [
                            selectedRoute.portOfLoadingLongitude,
                            selectedRoute.portOfDischargeLongitude
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
                              .format(selectedRoute.dateOfLoading),
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
                          color: Colors.white,
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
                              DateFormat("yyyy-MM-dd")
                                  .format(routes.data[index].dateOfLoading),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              routes.data[index].vesselName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${routes.data[index].portOfLoadingName} - ${routes.data[index].portOfDischargeName}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi perjalanan: ${routes.data[index].estimatedDay} hari',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Estimasi biaya: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(routes.data[index].estimatedCost)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Loading port coordinate: ${routes.data[index].portOfLoadingLatitude}, ${routes.data[index].portOfLoadingLongitude}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Discharge port coordinate: ${routes.data[index].portOfDischargeLatitude}, ${routes.data[index].portOfDischargeLongitude}',
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

                        final firstDayIndex = firstLocation.daily.time
                            .indexWhere((date) => date
                                .toIso8601String()
                                .startsWith(DateFormat("yyyy-MM-dd")
                                    .format(selectedRoute.dateOfLoading)));
                        final lastDayIndex = secondLocation != null
                            ? secondLocation.daily.time.indexWhere((date) =>
                                date.toIso8601String().startsWith(
                                    DateFormat("yyyy-MM-dd").format(
                                        selectedRoute
                                            .estimatedDateOfDischarge)))
                            : -1;
                        weatherCodeObject(int code) => weatherCodes.firstWhere(
                              (wc) => wc.code == code,
                              orElse: () => WeatherCode(
                                code: -1,
                                description: 'Unknown',
                                icon: Assets.icon.iconImageNotFound.image(
                                  height: 20,
                                ), // Fallback image
                              ),
                            );
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (firstDayIndex != -1) ...[
                              Text(
                                  'Location 1: ${firstLocation.latitude}, ${firstLocation.longitude}'),
                              Text(
                                  'Weather for ${DateFormat("yyyy-MM-dd").format(firstLocation.daily.time.first)}:'),
                              // Text(
                              //     'Weather Code: ${firstLocation.daily.weatherCode.first}'),
                              Row(
                                children: [
                                  weatherCodeObject(
                                          firstLocation.daily.weatherCode.first)
                                      .icon,
                                  const SizedBox(width: 8),
                                  Text(weatherCodeObject(
                                          firstLocation.daily.weatherCode.first)
                                      .description),
                                ],
                              ),
                              Text(
                                  'Max Temp: ${firstLocation.daily.temperature2MMax.first} °C'),
                              Text(
                                  'Min Temp: ${firstLocation.daily.temperature2MMin.first} °C'),
                              Text(
                                  'Wind speed: ${firstLocation.daily.windSpeed10MMax.first} km/h'),
                              Text(
                                  'Wind speed: ${firstLocation.daily.windDirection10MDominant.first} degree'),
                            ],
                            if (secondLocation != null &&
                                lastDayIndex != -1) ...[
                              Text(
                                  'Location 2: ${secondLocation.latitude}, ${secondLocation.longitude}'),
                              Text(
                                  'Weather for ${DateFormat("yyyy-MM-dd").format(secondLocation.daily.time.last)}:'),
                              Text(
                                  'Weather Code: ${secondLocation.daily.weatherCode.last}'),
                              Row(
                                children: [
                                  weatherCodeObject(
                                          secondLocation.daily.weatherCode.last)
                                      .icon,
                                  const SizedBox(width: 8),
                                  Text(weatherCodeObject(
                                          secondLocation.daily.weatherCode.last)
                                      .description),
                                ],
                              ),
                              Text(
                                  'Max Temp: ${secondLocation.daily.temperature2MMax.last} °C'),
                              Text(
                                  'Min Temp: ${secondLocation.daily.temperature2MMin.last} °C'),
                              Text(
                                  'Wind speed: ${secondLocation.daily.windSpeed10MMax.last} km/h'),
                              Text(
                                  'Wind speed: ${secondLocation.daily.windDirection10MDominant.last} degree'),
                            ],
                          ],
                        );
                      },
                    );
                  },
                ),
              const SizedBox(height: 16),
              Button.outlined(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddShipperConsigneeDataPage(
                        transactionIdMessage: widget.transactionIdMessage,
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
