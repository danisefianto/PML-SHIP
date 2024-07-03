import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/datasource/document_remote_datasource.dart';
import '../../../data/models/response/get_all_documents_response_model.dart';

part 'document_data_event.dart';
part 'document_data_state.dart';
part 'document_data_bloc.freezed.dart';

class DocumentDataBloc extends Bloc<DocumentDataEvent, DocumentDataState> {
  final DocumentRemoteDatasource datasource;
  DocumentDataBloc(this.datasource) : super(const _Initial()) {
    on<_GetDocumentsData>((event, emit) async {
      emit(const DocumentDataState.loading());
      final response = await datasource.getDocumentsData(event.transactionId);
      response.fold(
        (l) => emit(DocumentDataState.error(l)),
        (r) => emit(DocumentDataState.success(r)),
      );
    });
  }
}
