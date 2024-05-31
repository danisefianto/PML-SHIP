import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/request/weather_request_model.dart';
import '../../../../data/models/response/weather_response_model.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final OrderRemoteDatasource dataSource;

  WeatherBloc(this.dataSource) : super(const _Initial()) {
    on<_FetchWeather>((event, emit) async {
      emit(const _Loading());

      final result = await dataSource.fetchWeatherData(event.request);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
