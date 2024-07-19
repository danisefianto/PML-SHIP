import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/get_all_status_order_response_model.dart';

part 'history_order_event.dart';
part 'history_order_state.dart';
part 'history_order_bloc.freezed.dart';

class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final HistoryRemoteDatasource orderRemoteDatasource;
  HistoryOrderBloc(this.orderRemoteDatasource) : super(const _Initial()) {
    on<_GetPendingOrderData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllPendingOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
    on<_GetPaymentPendingOrderData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllPaymentPendingOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
    on<_GetOnShippingOrdersData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllOnShippingOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
    on<_GetCompletedOrdersData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllCompletedOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
    on<_GetCanceledOrdersData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllCanceledOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
    on<_GetRejectedOrderData>((event, emit) async {
      emit(const HistoryOrderState.loading());
      final response = await orderRemoteDatasource.getAllRejectedOrders();
      response.fold(
        (l) => emit(HistoryOrderState.error(l)),
        (r) => emit(HistoryOrderState.success(r)),
      );
    });
  }
}
