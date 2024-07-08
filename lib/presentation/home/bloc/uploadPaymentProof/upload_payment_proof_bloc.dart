import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/payment_remote_datasource.dart';
import '../../../../data/models/request/update_payment_request_model.dart';
import '../../../../data/models/response/update_payment_response_model.dart';

part 'upload_payment_proof_event.dart';
part 'upload_payment_proof_state.dart';
part 'upload_payment_proof_bloc.freezed.dart';

class UploadPaymentProofBloc
    extends Bloc<UploadPaymentProofEvent, UploadPaymentProofState> {
  final PaymentRemoteDatasource datasource;
  UploadPaymentProofBloc(this.datasource) : super(const _Initial()) {
    on<_UploadPaymentProof>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.uploadPaymentProof(
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
