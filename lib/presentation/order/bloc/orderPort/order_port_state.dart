part of 'order_port_bloc.dart';

@freezed
class OrderPortState with _$OrderPortState {
  const factory OrderPortState.initial() = _Initial;
  const factory OrderPortState.loading() = _Loading;
  const factory OrderPortState.success(
      OrderPortResponseModel orderPortResponseModel) = _Success;
  const factory OrderPortState.error(String message) = _Error;
}
