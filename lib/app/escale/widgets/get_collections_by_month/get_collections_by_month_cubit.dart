import 'package:basic/app/escale/request_response/get_collections_by_month/get_collections_by_month_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_collections_by_month/get_collections_by_month_request.dart';
import '../../services/transaction_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_collections_by_month_state.dart';

part 'get_collections_by_month_cubit.freezed.dart';

class GetCollectionsByMonthCubit extends BaseCubit<GetCollectionsByMonthState> {
  late TransactionService transactionService;
  GetCollectionsByMonthCubit({required super.context, int? month, int? year})
      : super(initialState: GetCollectionsByMonthState.initial(month: month, year: year)){
    transactionService=GetIt.instance<TransactionService>();
    getCollectionsByMonth(createRequestData());
  }

  updateSelectedCollectedUser(String? user) {
    emit(state.copyWith(selectedCollectedUser: user));
  }

    GetCollectionsByMonthRequest createRequestData({
    int? year,
      int? month
}) {
        final request = GetCollectionsByMonthRequest(
          year: year ?? state.year ?? DateTime.now().year,
          month: month ?? state.month ?? DateTime.now().month
        );
        return request;
      }

    Future<List<GetCollectionsByMonthResponse>> getCollectionsByMonth(
          GetCollectionsByMonthRequest request) async {
        return transactionService.getCollectionsByMonth(request).then((value) {
          emit(state.copyWith(
              getCollectionsByMonthResponse: value,
              getCollectionsByMonthStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getCollectionsByMonthStatus: BooleanStatus.error));
          throw error;
        });
      }
}
