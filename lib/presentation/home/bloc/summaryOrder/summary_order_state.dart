part of 'summary_order_bloc.dart';

@freezed
class SummaryOrderState with _$SummaryOrderState {
  const factory SummaryOrderState.initial() = _Initial;
  const factory SummaryOrderState.loading() = _Loading;
  const factory SummaryOrderState.success(
      OrderDetailResponseModel responseModel) = _Success;
  const factory SummaryOrderState.error(String message) = _Error;
}
