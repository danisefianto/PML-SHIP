part of 'pending_orders_data_bloc.dart';

@freezed
class PendingOrdersDataState with _$PendingOrdersDataState {
  const factory PendingOrdersDataState.initial() = _Initial;
  const factory PendingOrdersDataState.loading() = _Loading;
  const factory PendingOrdersDataState.error(String message) = _Error;
  const factory PendingOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
