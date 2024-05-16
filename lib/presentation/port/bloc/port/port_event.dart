part of 'port_bloc.dart';

@freezed
class PortEvent with _$PortEvent {
  const factory PortEvent.started() = _Started;
  const factory PortEvent.getPorts() = _GetPorts;
}
