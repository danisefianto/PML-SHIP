part of 'rejected_orders_data_bloc.dart';

@freezed
class RejectedOrdersDataEvent with _$RejectedOrdersDataEvent {
  const factory RejectedOrdersDataEvent.started() = _Started;
  const factory RejectedOrdersDataEvent.getAllRejectedOrders() =
      _GetRejectedOrderData;
}
