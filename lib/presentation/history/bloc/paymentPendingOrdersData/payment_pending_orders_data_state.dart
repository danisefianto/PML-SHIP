part of 'payment_pending_orders_data_bloc.dart';

@freezed
class PaymentPendingOrdersDataState with _$PaymentPendingOrdersDataState {
  const factory PaymentPendingOrdersDataState.initial() = _Initial;
  const factory PaymentPendingOrdersDataState.loading() = _Loading;
  const factory PaymentPendingOrdersDataState.error(String message) = _Error;
  const factory PaymentPendingOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
