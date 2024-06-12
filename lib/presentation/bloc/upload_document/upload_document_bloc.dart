import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/update_document_remote_datasource.dart';
import '../../../data/models/request/update_document_request_model.dart';
import '../../../data/models/response/update_document_response_model.dart';

part 'upload_document_bloc.freezed.dart';
part 'upload_document_event.dart';
part 'upload_document_state.dart';

class UploadDocumentBloc
    extends Bloc<UploadDocumentEvent, UploadDocumentState> {
  final UpdateDocumentRemoteDatasource updateDocumentRemoteDatasource;
  UploadDocumentBloc(this.updateDocumentRemoteDatasource)
      : super(const _Initial()) {
    on<_Upload>((event, emit) async {
      emit(const _Loading());
      final response = await updateDocumentRemoteDatasource.updateDocument(
        event.data,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
