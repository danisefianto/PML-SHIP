import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/payment_remote_datasource.dart';
import '../../../../data/models/response/payment_options_response_model.dart';

part 'payment_options_bloc.freezed.dart';
part 'payment_options_event.dart';
part 'payment_options_state.dart';

class PaymentOptionsBloc
    extends Bloc<PaymentOptionsEvent, PaymentOptionsState> {
  final PaymentRemoteDatasource datasource;
  PaymentOptionsBloc(this.datasource) : super(const _Initial()) {
    on<_GetPaymentOptions>((event, emit) async {
      emit(const PaymentOptionsState.loading());
      final response = await datasource.getPaymentOptions(event.transactionId);
      response.fold(
        (l) => emit(PaymentOptionsState.error(l)),
        (r) => emit(PaymentOptionsState.success(r)),
      );
    });
  }
}
