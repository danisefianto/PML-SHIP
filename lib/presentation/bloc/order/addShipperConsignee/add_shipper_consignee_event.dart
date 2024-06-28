part of 'add_shipper_consignee_bloc.dart';

@freezed
class AddShipperConsigneeEvent with _$AddShipperConsigneeEvent {
  const factory AddShipperConsigneeEvent.started() = _Started;
  const factory AddShipperConsigneeEvent.addShipperConsignee(
    AddShipperConsigneeRequestModel data,
  ) = _AddShipperConsignee;
}
