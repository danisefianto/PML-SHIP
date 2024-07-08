part of 'get_authenticated_user_bloc.dart';

@freezed
class GetAuthenticatedUserState with _$GetAuthenticatedUserState {
  const factory GetAuthenticatedUserState.initial() = _Initial;
  const factory GetAuthenticatedUserState.loading() = _Loading;
  const factory GetAuthenticatedUserState.loaded(UserResponseModel user) =
      _Loaded;
  const factory GetAuthenticatedUserState.error(String message) = _Error;
}
