part of 'canceled_orders_data_bloc.dart';

@freezed
class CanceledOrdersDataState with _$CanceledOrdersDataState {
  const factory CanceledOrdersDataState.initial() = _Initial;
  const factory CanceledOrdersDataState.loading() = _Loading;
  const factory CanceledOrdersDataState.error(String message) = _Error;
  const factory CanceledOrdersDataState.success(
      HistoryResponseModel getAllStatusOrderResponseModel) = _Success;
}
