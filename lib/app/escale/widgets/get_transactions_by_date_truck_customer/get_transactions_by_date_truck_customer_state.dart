part of 'get_transactions_by_date_truck_customer_cubit.dart';

@freezed
class GetTransactionsByDateTruckCustomerState
    with _$GetTransactionsByDateTruckCustomerState {
  const factory GetTransactionsByDateTruckCustomerState.initial({
    int? customerid,
    int? truckid,
    String? date,
    List<GetAllTransactionsResponse>? getAllTransactionsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTransactionsStatus,
    @Default(false) bool allSelected,
    @Default([]) List<GetAllTransactionsResponse> selectedTransactions,
  }) = _Initial;
}
