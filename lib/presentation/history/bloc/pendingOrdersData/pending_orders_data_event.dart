part of 'pending_orders_data_bloc.dart';

@freezed
class PendingOrdersDataEvent with _$PendingOrdersDataEvent {
  const factory PendingOrdersDataEvent.started() = _Started;
  const factory PendingOrdersDataEvent.getAllPendingOrders() =
      _GetPendingOrderData;
}
