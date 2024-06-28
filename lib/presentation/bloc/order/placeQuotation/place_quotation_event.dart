part of 'place_quotation_bloc.dart';

@freezed
class PlaceQuotationEvent with _$PlaceQuotationEvent {
  const factory PlaceQuotationEvent.started() = _Started;
  const factory PlaceQuotationEvent.placeQuotation(
    PlaceQuotationRequestModel data,
  ) = _PlaceQuotation;
}