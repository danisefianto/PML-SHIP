import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/history_remote_datasource.dart';
import '../../../../data/models/response/history_response_model.dart';

part 'payment_pending_orders_data_bloc.freezed.dart';
part 'payment_pending_orders_data_event.dart';
part 'payment_pending_orders_data_state.dart';

class PaymentPendingOrdersDataBloc
    extends Bloc<PaymentPendingOrdersDataEvent, PaymentPendingOrdersDataState> {
  final HistoryRemoteDatasource orderRemoteDatasource;
  PaymentPendingOrdersDataBloc(this.orderRemoteDatasource)
      : super(const _Initial()) {
    on<_GetPaymentPendingOrderData>((event, emit) async {
      emit(const PaymentPendingOrdersDataState.loading());
      final response = await orderRemoteDatasource.getAllPaymentPendingOrders();
      response.fold(
        (l) => emit(PaymentPendingOrdersDataState.error(l)),
        (r) => emit(PaymentPendingOrdersDataState.success(r)),
      );
    });
  }
}
