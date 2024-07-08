part of 'get_authenticated_user_bloc.dart';

@freezed
class GetAuthenticatedUserEvent with _$GetAuthenticatedUserEvent {
  const factory GetAuthenticatedUserEvent.started() = _Started;
  const factory GetAuthenticatedUserEvent.getAuthenticatedUser() =
      _GetAuthenticatedUser;
  // const factory GetAuthenticatedUserEvent.updateLatLong(
  //   double lat,
  //   double long,
  //   String address,
  // ) = _UpdateLatLong;
}
