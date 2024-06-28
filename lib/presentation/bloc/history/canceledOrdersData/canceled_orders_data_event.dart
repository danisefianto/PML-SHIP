part of 'canceled_orders_data_bloc.dart';

@freezed
class CanceledOrdersDataEvent with _$CanceledOrdersDataEvent {
  const factory CanceledOrdersDataEvent.started() = _Started;
  const factory CanceledOrdersDataEvent.getAllCanceledOrders() =
      _GetCanceledOrdersData;
}
