part of 'port_bloc.dart';

@freezed
class PortState with _$PortState {
  const factory PortState.initial() = _Initial;
  const factory PortState.loading() = _Loading;
  const factory PortState.error(String message) = _Error;
  const factory PortState.success(PortResponseModel port) = _Success;
}
