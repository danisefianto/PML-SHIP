part of 'check_quotation_bloc.dart';

@freezed
class CheckQuotationEvent with _$CheckQuotationEvent {
  const factory CheckQuotationEvent.started() = _Started;
  const factory CheckQuotationEvent.checkQuotation(
    CheckQuotationRequestModel data,
  ) = _CheckQuotation;
}
