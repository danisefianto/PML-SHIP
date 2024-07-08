import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'completed_orders_data_bloc.freezed.dart';
part 'completed_orders_data_event.dart';
part 'completed_orders_data_state.dart';

class CompletedOrdersDataBloc
    extends Bloc<CompletedOrdersDataEvent, CompletedOrdersDataState> {
  final HistoryRemoteDatasource orderRemoteDatasource;
  CompletedOrdersDataBloc(this.orderRemoteDatasource)
      : super(const _Initial()) {
    on<_GetCompletedOrdersData>((event, emit) async {
      emit(const CompletedOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllCompletedOrders();
      response.fold(
        (l) => emit(CompletedOrdersDataState.error(l)),
        (r) => emit(CompletedOrdersDataState.success(r)),
      );
    });
  }
}
