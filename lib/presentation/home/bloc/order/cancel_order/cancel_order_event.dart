part of 'cancel_order_bloc.dart';

@freezed
class CancelOrderEvent with _$CancelOrderEvent {
  const factory CancelOrderEvent.started() = _Started;
  const factory CancelOrderEvent.cancelOrder(
      CancelOrderRequestModel cancelOrderRequestModel,
      String transactionId) = _CancelOrder;
}
