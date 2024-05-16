import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pml_ship/data/datasource/user_remote_datasource.dart';
import 'package:pml_ship/data/models/response/user_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRemoteDatasource userRemoteDatasource;
  ProfileBloc(this.userRemoteDatasource) : super(const _Initial()) {
    on<ProfileEvent>((event, emit) async {
      emit(const ProfileState.loading());
      final response = await userRemoteDatasource.getFullUserData();
      response.fold(
        (l) => emit(ProfileState.error(l)),
        (r) => emit(ProfileState.success(r)),
      );
    });
  }
}
