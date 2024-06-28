part of 'rejected_orders_data_bloc.dart';

@freezed
class RejectedOrdersDataState with _$RejectedOrdersDataState {
  const factory RejectedOrdersDataState.initial() = _Initial;
  const factory RejectedOrdersDataState.loading() = _Loading;
  const factory RejectedOrdersDataState.error(String message) = _Error;
  const factory RejectedOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
