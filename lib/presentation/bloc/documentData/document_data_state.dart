part of 'document_data_bloc.dart';

@freezed
class DocumentDataState with _$DocumentDataState {
  const factory DocumentDataState.initial() = _Initial;
  const factory DocumentDataState.loading() = _Loading;
  const factory DocumentDataState.error(String message) = _Error;
  const factory DocumentDataState.success(
      GetAllDocumentsResponseModel documents) = _Success;
}
