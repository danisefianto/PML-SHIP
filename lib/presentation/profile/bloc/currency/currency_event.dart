part of 'currency_bloc.dart';

@freezed
class CurrencyEvent with _$CurrencyEvent {
  const factory CurrencyEvent.fetchRates(CurrencyRequestModel request) =
      _FetchRates;
}
