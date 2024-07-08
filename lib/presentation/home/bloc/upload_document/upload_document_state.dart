part of 'upload_document_bloc.dart';

@freezed
class UploadDocumentState with _$UploadDocumentState {
  const factory UploadDocumentState.initial() = _Initial;
  const factory UploadDocumentState.loading() = _Loading;
  const factory UploadDocumentState.success(
      UpdateDocumentResponseModel responseModel) = _Success;
  const factory UploadDocumentState.error(String message) = _Error;
}
