import 'package:basic/app/escale/models/return_transaction_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../request_response/delete_transaction/delete_transaction_request.dart';
import '../../../services/transaction_service.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'delete_return_transaction_popup_content_state.dart';

part 'delete_return_transaction_popup_content_cubit.freezed.dart';

class DeleteReturnTransactionPopupContentCubit
    extends BaseCubit<DeleteReturnTransactionPopupContentState> {
  late TransactionService transactionService;
  DeleteReturnTransactionPopupContentCubit({required super.context, required ReturnTransactions transaction}) : super(
      initialState: DeleteReturnTransactionPopupContentState.initial(
          loadingButton: false, transactionid: transaction.id)){
    transactionService=GetIt.instance<TransactionService>();
  }


  DeleteTransactionRequest createRequestData({
    int? transactionid
  }) {
    final request = DeleteTransactionRequest(
        transactionid: transactionid ?? state.transactionid
    );
    return request;
  }

  Future<void> deleteTransaction(
      DeleteTransactionRequest request) async {
    return transactionService.deleteTransaction(request).then((value) {
      emit(state.copyWith(
          deleteTransactionStatus: BooleanStatus.success));
      showSuccessMessage("Deleted Transaction successfully");
      return value;
    }).catchError((error) {
      emit(state.copyWith(deleteTransactionStatus: BooleanStatus.error));
      showErrorMessage("Failed to delete transaction");
      throw error;
    });
  }



  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }
}
