part of 'order_port_bloc.dart';

@freezed
class OrderPortEvent with _$OrderPortEvent {
  const factory OrderPortEvent.started() = _Started;
  const factory OrderPortEvent.orderPort(
    OrderPortRequestModel data,
  ) = _OrderPort;
}
