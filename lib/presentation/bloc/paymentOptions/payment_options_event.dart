part of 'payment_options_bloc.dart';

@freezed
class PaymentOptionsEvent with _$PaymentOptionsEvent {
  const factory PaymentOptionsEvent.started() = _Started;
  const factory PaymentOptionsEvent.getPaymentOptions(String transactionId) =
      _GetPaymentOptions;
}
