import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'rejected_orders_data_bloc.freezed.dart';
part 'rejected_orders_data_event.dart';
part 'rejected_orders_data_state.dart';

class RejectedOrdersDataBloc
    extends Bloc<RejectedOrdersDataEvent, RejectedOrdersDataState> {
  final HistoryRemoteDatasource orderRemoteDatasource;

  RejectedOrdersDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetRejectedOrderData>((event, emit) async {
      emit(const RejectedOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllRejectedOrders();
      response.fold(
        (l) => emit(RejectedOrdersDataState.error(l)),
        (r) => emit(RejectedOrdersDataState.success(r)),
      );
    });
  }
}
