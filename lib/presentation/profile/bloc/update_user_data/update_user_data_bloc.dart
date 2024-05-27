import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/datasource/update_user_data_remote_datasource.dart';
import '../../../../data/models/request/update_user_data_request_model.dart';
import '../../../../data/models/response/update_user_data_response_model.dart';

part 'update_user_data_event.dart';
part 'update_user_data_state.dart';
part 'update_user_data_bloc.freezed.dart';

class UpdateUserDataBloc
    extends Bloc<UpdateUserDataEvent, UpdateUserDataState> {
  final UpdateUserDataRemoteDataSource datasource;
  UpdateUserDataBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_UpdateUserData>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.updateUserData(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
