part of 'currency_bloc.dart';

@freezed
class CurrencyEvent with _$CurrencyEvent {
  const factory CurrencyEvent.fetchRates() = _FetchRates;
}
