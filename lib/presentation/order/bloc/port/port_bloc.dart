import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship/data/datasource/port_remote_datasource.dart';
import 'package:pml_ship/data/models/response/port_response_model.dart';

part 'port_event.dart';
part 'port_state.dart';
part 'port_bloc.freezed.dart';

class PortBloc extends Bloc<PortEvent, PortState> {
  final PortRemoteDataSource portRemoteDatasource;
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
