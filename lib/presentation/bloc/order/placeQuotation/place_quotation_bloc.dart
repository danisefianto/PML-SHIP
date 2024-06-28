import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasource/order_remote_datasource.dart';
import '../../../../data/models/request/place_quotation_request_model.dart';
import '../../../../data/models/response/place_quotation_response_model.dart';

part 'place_quotation_bloc.freezed.dart';
part 'place_quotation_event.dart';
part 'place_quotation_state.dart';

class PlaceQuotationBloc
    extends Bloc<PlaceQuotationEvent, PlaceQuotationState> {
  final OrderRemoteDatasource datasource;
  PlaceQuotationBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_PlaceQuotation>((event, emit) async {
      emit(const _Loading());

      final result = await datasource.placeQuotation(event.data);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
