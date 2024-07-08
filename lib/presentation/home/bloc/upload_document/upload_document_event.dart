part of 'upload_document_bloc.dart';

@freezed
class UploadDocumentEvent with _$UploadDocumentEvent {
  const factory UploadDocumentEvent.started() = _Started;
  const factory UploadDocumentEvent.uploadDocument(
      UpdateDocumentRequestModel data, String transactionId) = _UploadDocument;
}
