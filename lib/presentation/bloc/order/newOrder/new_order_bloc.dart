import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/request/new_order_request_model.dart';
import '../../../../data/models/response/new_order_response_model.dart';

part 'new_order_bloc.freezed.dart';
part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final OrderRemoteDatasource datasource;
  NewOrderBloc(this.datasource) : super(const _Initial()) {
    on<_PlaceOrder>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.newOrder(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
