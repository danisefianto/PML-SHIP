part of 'on_shipping_orders_data_bloc.dart';

@freezed
class OnShippingOrdersDataEvent with _$OnShippingOrdersDataEvent {
  const factory OnShippingOrdersDataEvent.started() = _Started;
  const factory OnShippingOrdersDataEvent.getAllOnShippingOrders() =
      _GetOnShippingOrdersData;
}
