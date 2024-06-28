part of 'add_conference_bloc.dart';

@freezed
class AddConferenceState with _$AddConferenceState {
  const factory AddConferenceState.initial() = _Initial;
  const factory AddConferenceState.loading() = _Loading;
  const factory AddConferenceState.error(String message) = _Error;
  const factory AddConferenceState.success(
      AddConferenceResponseModel addConferenceResponseModel) = _Success;
}
