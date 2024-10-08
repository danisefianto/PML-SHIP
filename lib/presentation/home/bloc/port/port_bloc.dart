import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/response/port_response_model.dart';

part 'port_bloc.freezed.dart';
part 'port_event.dart';
part 'port_state.dart';

class PortBloc extends Bloc<PortEvent, PortState> {
  final OrderRemoteDatasource portRemoteDatasource;
  PortBloc(this.portRemoteDatasource) : super(const _Initial()) {
    on<PortEvent>((event, emit) async {
      emit(const PortState.loading());
      final response = await portRemoteDatasource.getPorts();
      response.fold(
        (l) => emit(PortState.error(l)),
        (r) => emit(PortState.success(r)),
      );
    });
  }
}
