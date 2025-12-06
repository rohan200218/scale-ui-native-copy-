import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date_range/get_collections_by_date_range_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_collections_by_date_range/get_collections_by_date_range_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_collections_by_date_range_state.dart';

part 'get_collections_by_date_range_cubit.freezed.dart';

class GetCollectionsByDateRangeCubit
    extends BaseCubit<GetCollectionsByDateRangeState> {
  late TransactionService transactionService;
  GetCollectionsByDateRangeCubit({required super.context, String? startDate, String? endDate})
      : super(initialState: GetCollectionsByDateRangeState.initial(startDate: startDate, endDate: endDate)){
    transactionService=GetIt.instance<TransactionService>();
    getCollectionsByDateRange(createRequestData());
  }

  void updateSelectedCollectedUser(String? user) {
    emit(state.copyWith(selectedCollectedUser: user));
  }

  GetCollectionsByDateRangeRequest createRequestData({
    String? startDate,
      String? endDate
      }) {
        final request = GetCollectionsByDateRangeRequest(
          startDate: startDate ?? state.startDate ?? AppDateTimeUtils.getCurrentDate(),
          endDate: endDate ?? state.endDate ?? AppDateTimeUtils.getCurrentDate()
        );
        return request;
      }

    Future<List<GetCollectionsByDateRangeResponse>> getCollectionsByDateRange(
          GetCollectionsByDateRangeRequest request) async {
        return transactionService.getCollectionsByDateRange(request).then((value) {
          emit(state.copyWith(
              getCollectionsByDateRangeResponse: value,
              getCollectionsByDateRangeStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getCollectionsByDateRangeStatus: BooleanStatus.error));
          throw error;
        });
      }
}
