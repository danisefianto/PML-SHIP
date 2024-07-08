// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship/data/models/response/add_conference_response_model.dart';

import '../../../../../data/datasource/order_remote_datasource.dart';
import '../../../../../data/models/request/add_conference_request_model.dart';

part 'add_conference_bloc.freezed.dart';
part 'add_conference_event.dart';
part 'add_conference_state.dart';

class AddConferenceBloc extends Bloc<AddConferenceEvent, AddConferenceState> {
  final OrderRemoteDatasource datasource;
  AddConferenceBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_AddConference>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.addConference(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
