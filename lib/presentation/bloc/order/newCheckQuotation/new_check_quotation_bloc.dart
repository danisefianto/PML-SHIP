import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/request/new_check_quotation_request_model.dart';
import '../../../../data/models/response/new_check_quotation_response_model.dart';

part 'new_check_quotation_event.dart';
part 'new_check_quotation_state.dart';
part 'new_check_quotation_bloc.freezed.dart';

class NewCheckQuotationBloc
    extends Bloc<NewCheckQuotationEvent, NewCheckQuotationState> {
  final OrderRemoteDatasource datasource;
  NewCheckQuotationBloc(this.datasource) : super(const _Initial()) {
    on<_CheckQuotation>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.newcheckQuotation(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
