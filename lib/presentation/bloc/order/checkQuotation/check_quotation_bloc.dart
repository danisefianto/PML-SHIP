import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/request/check_quotation_request_model.dart';
import '../../../../data/models/response/check_quotation_response_model.dart';

part 'check_quotation_bloc.freezed.dart';
part 'check_quotation_event.dart';
part 'check_quotation_state.dart';

class CheckQuotationBloc
    extends Bloc<CheckQuotationEvent, CheckQuotationState> {
  final OrderRemoteDatasource datasource;
  CheckQuotationBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_CheckQuotation>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.checkQuotation(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
