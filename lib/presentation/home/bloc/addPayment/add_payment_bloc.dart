import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/payment_remote_datasource.dart';
import '../../../../data/models/request/add_payment_request_model.dart';
import '../../../../data/models/response/add_payment_response_model.dart';

part 'add_payment_bloc.freezed.dart';
part 'add_payment_event.dart';
part 'add_payment_state.dart';

class AddPaymentBloc extends Bloc<AddPaymentEvent, AddPaymentState> {
  final PaymentRemoteDatasource datasource;
  AddPaymentBloc(this.datasource) : super(const _Initial()) {
    on<_AddPayment>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.addPayment(event.requestModel);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
