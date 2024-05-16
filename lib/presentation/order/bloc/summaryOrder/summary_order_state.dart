part of 'summary_order_bloc.dart';

sealed class SummaryOrderState extends Equatable {
  const SummaryOrderState();
  
  @override
  List<Object> get props => [];
}

final class SummaryOrderInitial extends SummaryOrderState {}
