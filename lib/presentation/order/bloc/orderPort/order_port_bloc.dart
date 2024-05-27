import 'package:bloc/bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship/data/datasource/order_port_remote_datasource.dart';
import 'package:pml_ship/data/models/request/order_port_request_model.dart';
import 'package:pml_ship/data/models/response/order_port_response_model.dart';

part 'order_port_bloc.freezed.dart';
part 'order_port_event.dart';
part 'order_port_state.dart';

class OrderPortBloc extends Bloc<OrderPortEvent, OrderPortState> {
  final OrderPortRemoteDataSource datasource;
  OrderPortBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_OrderPort>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.orderPort(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
