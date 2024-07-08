part of 'payment_pending_orders_data_bloc.dart';

@freezed
class PaymentPendingOrdersDataEvent with _$PaymentPendingOrdersDataEvent {
  const factory PaymentPendingOrdersDataEvent.started() = _Started;
  const factory PaymentPendingOrdersDataEvent.getAllPaymentPendingOrders() =
      _GetPaymentPendingOrderData;
}
