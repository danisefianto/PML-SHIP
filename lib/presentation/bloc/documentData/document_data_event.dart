part of 'document_data_bloc.dart';

@freezed
class DocumentDataEvent with _$DocumentDataEvent {
  const factory DocumentDataEvent.started() = _Started;
  const factory DocumentDataEvent.getDocumentsData(String transactionId) =
      _GetDocumentsData;
}
