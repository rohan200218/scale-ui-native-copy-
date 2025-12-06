import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/escale/request_response/get_collections_by_date/get_collections_by_date_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_collections_by_date/get_collections_by_date_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_collections_by_date_state.dart';

part 'get_collections_by_date_cubit.freezed.dart';

class GetCollectionsByDateCubit extends BaseCubit<GetCollectionsByDateState> {
  late TransactionService transactionService;

  GetCollectionsByDateCubit({required super.context, String? date})
      : super(initialState: GetCollectionsByDateState.initial(date: date)) {
    transactionService = GetIt.instance<TransactionService>();
    getCollectionsByDate(createRequestData());
  }

  void updateSelectedCollectedUser(String? user) {
    emit(state.copyWith(selectedCollectedUser: user));
  }

  GetCollectionsByDateRequest createRequestData({String? date}) {
    final request = GetCollectionsByDateRequest(
        date: date ?? state.date ?? AppDateTimeUtils.getCurrentDate());
    return request;
  }

  Future<List<GetCollectionsByDateResponse>> getCollectionsByDate(
      GetCollectionsByDateRequest request) async {
    return transactionService.getCollectionsByDate(request).then((value) {
      emit(state.copyWith(
          getCollectionsByDateResponse: value,
          getCollectionsByDateStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getCollectionsByDateStatus: BooleanStatus.error));
      throw error;
    });
  }
}
