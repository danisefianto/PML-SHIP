part of 'new_order_bloc.dart';

@freezed
class NewOrderState with _$NewOrderState {
  const factory NewOrderState.initial() = _Initial;
  const factory NewOrderState.loading() = _Loading;
  const factory NewOrderState.success(
      NewOrderResponseModel orderResponseModel) = _Success;
  const factory NewOrderState.error(String message) = _Error;
}
