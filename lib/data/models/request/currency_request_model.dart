class CurrencyRequestModel {
  final String apikey;
  final String baseCurrency;
  final List<String> currencies;

  CurrencyRequestModel({
    required this.apikey,
    required this.baseCurrency,
    required this.currencies,
  });

  Map<String, String> toQueryParameters() {
    return {
      'apikey': apikey,
      'base_currency': baseCurrency,
      'currencies': currencies.join(','),
    };
  }
}
