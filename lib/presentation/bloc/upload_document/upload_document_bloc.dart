import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/document_remote_datasource.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../../data/models/response/update_document_response_model.dart';

part 'upload_document_bloc.freezed.dart';
part 'upload_document_event.dart';
part 'upload_document_state.dart';

class UploadDocumentBloc
    extends Bloc<UploadDocumentEvent, UploadDocumentState> {
  final DocumentRemoteDatasource datasource;
  UploadDocumentBloc(this.datasource) : super(const _Initial()) {
    on<_UploadDocument>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.uploadDocument(
        event.data,
        event.transactionId,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
