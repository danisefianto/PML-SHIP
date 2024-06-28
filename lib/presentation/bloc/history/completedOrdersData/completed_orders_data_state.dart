part of 'completed_orders_data_bloc.dart';

@freezed
class CompletedOrdersDataState with _$CompletedOrdersDataState {
  const factory CompletedOrdersDataState.initial() = _Initial;
  const factory CompletedOrdersDataState.loading() = _Loading;
  const factory CompletedOrdersDataState.error(String message) = _Error;
  const factory CompletedOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
