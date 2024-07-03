part of 'upload_payment_proof_bloc.dart';

@freezed
class UploadPaymentProofEvent with _$UploadPaymentProofEvent {
  const factory UploadPaymentProofEvent.started() = _Started;
  const factory UploadPaymentProofEvent.uploadPaymentProof(
          UpdatePaymentRequestModel data, String transactionId) =
      _UploadPaymentProof;
}
