part of 'add_payment_bloc.dart';

@freezed
class AddPaymentEvent with _$AddPaymentEvent {
  const factory AddPaymentEvent.started() = _Started;
  const factory AddPaymentEvent.addPayment(
    AddPaymentRequestModel requestModel,
  ) = _AddPayment;
}
