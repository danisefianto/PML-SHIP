import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'history_bloc.freezed.dart';
part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRemoteDatasource historyRemoteDatasource;
  HistoryBloc(this.historyRemoteDatasource) : super(const _Initial()) {
    on<_GetHistory>((event, emit) async {
      emit(const HistoryState.loading());
      final response = await historyRemoteDatasource.getHistory();
      response.fold(
        (l) => emit(HistoryState.error(l)),
        (r) => emit(HistoryState.success(r)),
      );
    });
  }
}
