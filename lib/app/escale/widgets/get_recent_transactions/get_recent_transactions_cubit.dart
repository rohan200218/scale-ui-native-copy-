import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_all_transactions/get_all_transactions_request.dart';
import '../../services/transaction_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_recent_transactions_state.dart';

part 'get_recent_transactions_cubit.freezed.dart';

class GetRecentTransactionsCubit extends BaseCubit<GetRecentTransactionsState> {
  late TransactionService transactionService;
  GetRecentTransactionsCubit({required super.context})
      : super(initialState: GetRecentTransactionsState.initial()){
    transactionService=GetIt.instance<TransactionService>();
    getRecentTransactions(createRequestData());
  }

  GetAllTransactionsRequest createRequestData() {
    final request = GetAllTransactionsRequest();
    return request;
  }

  Future<List<GetAllTransactionsResponse>> getRecentTransactions(
      GetAllTransactionsRequest request) async {
    return transactionService.getRecentTransactions(request).then((value) {
      emit(state.copyWith(
          getAllTransactionsResponse: value,
          getAllTransactionsStatus: BooleanStatus.success));
      return Future.value(value);
    }).catchError((error) {
      emit(state.copyWith(getAllTransactionsStatus: BooleanStatus.error));
      showErrorMessage("Failed to fetch transactions");
      throw error;
    });
  }

}
