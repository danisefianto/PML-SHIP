part of 'new_check_quotation_bloc.dart';

@freezed
class NewCheckQuotationState with _$NewCheckQuotationState {
  const factory NewCheckQuotationState.initial() = _Initial;
  const factory NewCheckQuotationState.loading() = _Loading;
  const factory NewCheckQuotationState.success(
      NewCheckQuotationResponseModel quotationResponseModel) = _Success;
  const factory NewCheckQuotationState.error(String message) = _Error;
}
