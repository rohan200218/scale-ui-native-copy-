part of 'get_transactions_by_date_cubit.dart';

@freezed
class GetTransactionsByDateState with _$GetTransactionsByDateState {
  const factory GetTransactionsByDateState.initial({
    required String date,
    List<GetAllTransactionsResponse>? getAllTransactionsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTransactionsStatus,
}) = _Initial;
}
