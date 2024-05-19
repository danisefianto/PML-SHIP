part of 'currency_bloc.dart';

@freezed
class CurrencyState with _$CurrencyState {
  const factory CurrencyState.initial() = _Initial;
  const factory CurrencyState.loading() = _Loading;
  const factory CurrencyState.success(
      CurrencyResponseModel currencyResponseModel) = _Success;
  const factory CurrencyState.error(String message) = _Error;
}
