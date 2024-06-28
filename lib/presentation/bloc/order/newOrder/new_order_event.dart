part of 'new_order_bloc.dart';

@freezed
class NewOrderEvent with _$NewOrderEvent {
  const factory NewOrderEvent.started() = _Started;
  const factory NewOrderEvent.placeOrder(
    NewOrderRequestModel data,
  ) = _PlaceOrder;
}
