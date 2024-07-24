import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/datasource/order_remote_datasource.dart';
import '../../../../../data/models/request/cancel_order_request_model.dart';
import '../../../../../data/models/response/update_order_status_response_model.dart';

part 'cancel_order_event.dart';
part 'cancel_order_state.dart';
part 'cancel_order_bloc.freezed.dart';

class CancelOrderBloc extends Bloc<CancelOrderEvent, CancelOrderState> {
  final OrderRemoteDatasource datasource;
  CancelOrderBloc(this.datasource) : super(const _Initial()) {
    on<_CancelOrder>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.cancelOrder(
        event.cancelOrderRequestModel,
        event.transactionId,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
