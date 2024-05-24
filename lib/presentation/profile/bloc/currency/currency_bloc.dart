import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship/data/datasource/currency_remote_datasource.dart';
import 'package:pml_ship/data/models/response/currency_response_model.dart';

part 'currency_event.dart';
part 'currency_state.dart';
part 'currency_bloc.freezed.dart';

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
