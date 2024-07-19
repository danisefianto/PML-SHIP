part of 'history_order_bloc.dart';

@freezed
class HistoryOrderEvent with _$HistoryOrderEvent {
  const factory HistoryOrderEvent.started() = _Started;
  const factory HistoryOrderEvent.getAllPendingOrders() = _GetPendingOrderData;
  const factory HistoryOrderEvent.getAllPaymentPendingOrders() =
      _GetPaymentPendingOrderData;
  const factory HistoryOrderEvent.getAllOnShippingOrders() =
      _GetOnShippingOrdersData;
  const factory HistoryOrderEvent.getAllCompletedOrders() =
      _GetCompletedOrdersData;
  const factory HistoryOrderEvent.getAllCanceledOrders() =
      _GetCanceledOrdersData;
  const factory HistoryOrderEvent.getAllRejectedOrders() =
      _GetRejectedOrderData;
}
