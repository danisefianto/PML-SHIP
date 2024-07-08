import 'package:bloc/bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pml_ship/data/models/response/summary_order_response_model.dart';

import '../../../../data/datasource/order_remote_datasource.dart';

part 'summary_order_bloc.freezed.dart';
part 'summary_order_event.dart';
part 'summary_order_state.dart';

class SummaryOrderBloc extends Bloc<SummaryOrderEvent, SummaryOrderState> {
  final OrderRemoteDatasource datasource;
  SummaryOrderBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_SummaryOrder>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.getSummaryOrder(event.transactionId);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
