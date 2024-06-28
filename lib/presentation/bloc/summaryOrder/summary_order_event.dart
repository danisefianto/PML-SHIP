part of 'summary_order_bloc.dart';

@freezed
class SummaryOrderEvent with _$SummaryOrderEvent {
  const factory SummaryOrderEvent.started() = _Started;
  const factory SummaryOrderEvent.getSummaryOrder(
    String transactionId,
  ) = _SummaryOrder;
}
