part of 'completed_orders_data_bloc.dart';

@freezed
class CompletedOrdersDataEvent with _$CompletedOrdersDataEvent {
  const factory CompletedOrdersDataEvent.started() = _Started;
  const factory CompletedOrdersDataEvent.getAllCompletedOrders() =
      _GetCompletedOrdersData;
}
