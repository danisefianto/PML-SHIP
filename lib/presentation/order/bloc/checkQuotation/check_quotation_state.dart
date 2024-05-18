part of 'check_quotation_bloc.dart';

@freezed
class CheckQuotationState with _$CheckQuotationState {
  const factory CheckQuotationState.initial() = _Initial;
  const factory CheckQuotationState.loading() = _Loading;
  const factory CheckQuotationState.success(
      QuotationResponseModel quotationResponseModel) = _Success;
  const factory CheckQuotationState.error(String message) = _Error;
}
