import 'package:basic/app/core/utils/date_time/app_date_time_utils.dart';
import 'package:basic/app/escale/request_response/get_all_transactions/get_all_transactions_request.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_all_transactions/get_all_transactions_response.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_transactions_by_date_truck_customer_state.dart';

part 'get_transactions_by_date_truck_customer_cubit.freezed.dart';

class GetTransactionsByDateTruckCustomerCubit
    extends BaseCubit<GetTransactionsByDateTruckCustomerState> {
  late TransactionService transactionService;

  GetTransactionsByDateTruckCustomerCubit(
      {required super.context,
      int? customerId,
      int? truckId,
      String? date})
      : super(
            initialState: GetTransactionsByDateTruckCustomerState.initial(
                customerid: customerId, truckid: truckId, date: date)) {
    transactionService = GetIt.instance<TransactionService>();
  }

  GetAllTransactionsRequest createRequestData({
    int? customerid,
    int? truckid,
    String? date,
  }) {
    final request = GetAllTransactionsRequest(
        customerid: customerid ?? state.customerid,
        truckid: truckid ?? state.truckid,
        date: date ?? state.date ?? AppDateTimeUtils.getCurrentDate());
    return request;
  }

  Future<List<GetAllTransactionsResponse>> getTransactionsByDateTruckCustomer(
      GetAllTransactionsRequest request) async {
    return transactionService
        .getTransactionsByDateTruckCustomer(request)
        .then((value) {
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



  void toggleSelectAll(bool isSelected) {
    if (isSelected) {
      emit(state.copyWith(
        allSelected: true,
        selectedTransactions: List.from(state.getAllTransactionsResponse ?? []),
      ));
    } else {
      emit(state.copyWith(
        allSelected: false,
        selectedTransactions: [],
      ));
    }
  }


  void toggleTransactionSelection(GetAllTransactionsResponse transaction, bool isSelected) {
    final updatedSelectedTransactions = List<GetAllTransactionsResponse>.from(state.selectedTransactions);

    if (isSelected) {
      updatedSelectedTransactions.add(transaction);
    } else {
      updatedSelectedTransactions.remove(transaction);
    }

    emit(state.copyWith(
      selectedTransactions: updatedSelectedTransactions,
      allSelected: updatedSelectedTransactions.length == (state.getAllTransactionsResponse?.length ?? 0),
    ));
  }

bool isTransactionSelected(GetAllTransactionsResponse transaction) {
    return state.selectedTransactions.contains(transaction);
  }
}
