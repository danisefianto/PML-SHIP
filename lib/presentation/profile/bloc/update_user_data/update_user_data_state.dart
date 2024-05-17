part of 'update_user_data_bloc.dart';

@freezed
class UpdateUserDataState with _$UpdateUserDataState {
  const factory UpdateUserDataState.initial() = _Initial;
  const factory UpdateUserDataState.loading() = _Loading;
  const factory UpdateUserDataState.success(
      UpdateUserDataResponseModel updateUserDataResponseModel) = _Success;
  const factory UpdateUserDataState.error(String message) = _Error;
}
