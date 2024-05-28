import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/currency_remote_datasource.dart';
import '../../../../data/models/response/currency_response_model.dart';

part 'currency_bloc.freezed.dart';
part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRemoteDataSource dataSource;

  CurrencyBloc(this.dataSource) : super(const _Initial()) {
    on<_FetchRates>((event, emit) async {
      emit(const _Loading());

      final result = await dataSource.fetchLatestRates();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
