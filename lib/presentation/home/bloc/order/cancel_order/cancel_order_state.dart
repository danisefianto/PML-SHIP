part of 'cancel_order_bloc.dart';

@freezed
class CancelOrderState with _$CancelOrderState {
  const factory CancelOrderState.initial() = _Initial;
  const factory CancelOrderState.loading() = _Loading;
  const factory CancelOrderState.error(String message) = _Error;
  const factory CancelOrderState.success(
      UpdateOrderStatusResponseModel updateOrderStatusResponseModel) = _Success;
}
