part of 'upload_payment_proof_bloc.dart';

@freezed
class UploadPaymentProofState with _$UploadPaymentProofState {
  const factory UploadPaymentProofState.initial() = _Initial;
  const factory UploadPaymentProofState.loading() = _Loading;
  const factory UploadPaymentProofState.success(
      UpdatePaymentResponseModel responseModel) = _Success;
  const factory UploadPaymentProofState.error(String message) = _Error;
}
