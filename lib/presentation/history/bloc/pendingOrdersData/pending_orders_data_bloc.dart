import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'pending_orders_data_bloc.freezed.dart';
part 'pending_orders_data_event.dart';
part 'pending_orders_data_state.dart';

class PendingOrdersDataBloc
    extends Bloc<PendingOrdersDataEvent, PendingOrdersDataState> {
  final HistoryRemoteDatasource orderRemoteDatasource;
  PendingOrdersDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingOrderData>((event, emit) async {
      emit(const PendingOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllPendingOrders();
      response.fold(
        (l) => emit(PendingOrdersDataState.error(l)),
        (r) => emit(PendingOrdersDataState.success(r)),
      );
    });
  }
}
