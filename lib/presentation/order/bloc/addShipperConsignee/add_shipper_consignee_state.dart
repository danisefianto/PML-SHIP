part of 'add_shipper_consignee_bloc.dart';

@freezed
class AddShipperConsigneeState with _$AddShipperConsigneeState {
  const factory AddShipperConsigneeState.initial() = _Initial;
  const factory AddShipperConsigneeState.loading() = _Loading;
  const factory AddShipperConsigneeState.success(
          AddShipperConsigneeResponseModel addShipperConsigneeResponseModel) =
      _Success;
  const factory AddShipperConsigneeState.error(String message) = _Error;
}
