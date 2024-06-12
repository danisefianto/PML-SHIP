part of 'add_conference_bloc.dart';

@freezed
class AddConferenceEvent with _$AddConferenceEvent {
  const factory AddConferenceEvent.started() = _Started;
  const factory AddConferenceEvent.addConference(
      AddConferenceRequestModel data) = _AddConference;
}
