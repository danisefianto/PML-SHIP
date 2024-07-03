import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'canceled_orders_data_bloc.freezed.dart';
part 'canceled_orders_data_event.dart';
part 'canceled_orders_data_state.dart';

class CanceledOrdersDataBloc
    extends Bloc<CanceledOrdersDataEvent, CanceledOrdersDataState> {
  final HistoryRemoteDatasource orderRemoteDatasource;
  CanceledOrdersDataBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetCanceledOrdersData>((event, emit) async {
      emit(const CanceledOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllCanceledOrders();
      response.fold(
        (l) => emit(CanceledOrdersDataState.error(l)),
        (r) => emit(CanceledOrdersDataState.success(r)),
      );
    });
  }
}
