import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'summary_order_event.dart';
part 'summary_order_state.dart';

class SummaryOrderBloc extends Bloc<SummaryOrderEvent, SummaryOrderState> {
  SummaryOrderBloc() : super(SummaryOrderInitial()) {
    on<SummaryOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
