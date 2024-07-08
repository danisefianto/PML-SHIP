part of 'payment_options_bloc.dart';

@freezed
class PaymentOptionsState with _$PaymentOptionsState {
  const factory PaymentOptionsState.initial() = _Initial;
  const factory PaymentOptionsState.loading() = _Loading;
  const factory PaymentOptionsState.error(String message) = _Error;
  const factory PaymentOptionsState.success(
      PaymentOptionsResponseModel paymentOptions) = _Success;
}
