part of 'new_check_quotation_bloc.dart';

@freezed
class NewCheckQuotationEvent with _$NewCheckQuotationEvent {
  const factory NewCheckQuotationEvent.started() = _Started;
  const factory NewCheckQuotationEvent.checkQuotation(
    CheckQuotationRequestModel data,
  ) = _CheckQuotation;
}
