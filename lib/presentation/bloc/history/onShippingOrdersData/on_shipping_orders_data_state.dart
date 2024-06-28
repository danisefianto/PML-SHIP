part of 'on_shipping_orders_data_bloc.dart';

@freezed
class OnShippingOrdersDataState with _$OnShippingOrdersDataState {
  const factory OnShippingOrdersDataState.initial() = _Initial;
  const factory OnShippingOrdersDataState.loading() = _Loading;
  const factory OnShippingOrdersDataState.error(String message) = _Error;
  const factory OnShippingOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
