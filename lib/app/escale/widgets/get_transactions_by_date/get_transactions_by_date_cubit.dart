import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_request.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_transactions_by_date_state.dart';

part 'get_transactions_by_date_cubit.freezed.dart';

class GetTransactionsByDateCubit extends BaseCubit<GetTransactionsByDateState> {
  late TransactionService transactionService;

  GetTransactionsByDateCubit({required super.context, required String date})
      : super(initialState: GetTransactionsByDateState.initial(date: date)) {
    transactionService = GetIt.instance<TransactionService>();
    getTransactionsByDate(createRequestData());
  }

  GetAllTransactionsRequest createRequestData({
    String? date
}) {
    final request = GetAllTransactionsRequest(
      date: date ?? state.date
    );
    return request;
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDate(
      GetAllTransactionsRequest request) async {
    return transactionService.getTransactionsByDate(request).then((value) {
      emit(state.copyWith(
          getAllTransactionsResponse: value,
          getAllTransactionsStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllTransactionsStatus: BooleanStatus.error));
      throw error;
    });
  }
}
