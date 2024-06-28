part of 'place_quotation_bloc.dart';

@freezed
class PlaceQuotationState with _$PlaceQuotationState {
  const factory PlaceQuotationState.initial() = _Initial;
  const factory PlaceQuotationState.loading() = _Loading;
  const factory PlaceQuotationState.success(PlaceQuotationResponseModel data) =
      _Success;
  const factory PlaceQuotationState.error(String message) = _Error;
}
