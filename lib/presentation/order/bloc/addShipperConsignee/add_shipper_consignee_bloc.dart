import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/add_shipper_consignee_remote_datasource.dart';
import '../../../../data/models/request/add_shipper_consignee_request_model.dart';
import '../../../../data/models/response/add_shipper_consignee_response_model.dart';

part 'add_shipper_consignee_bloc.freezed.dart';
part 'add_shipper_consignee_event.dart';
part 'add_shipper_consignee_state.dart';

class AddShipperConsigneeBloc
    extends Bloc<AddShipperConsigneeEvent, AddShipperConsigneeState> {
  final AddShipperConsigneeRemoteDataSource datasource;
  AddShipperConsigneeBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_AddShipperConsignee>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.addShipperConsignee(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
