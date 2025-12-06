part of 'get_recent_transactions_cubit.dart';

@freezed
class GetRecentTransactionsState with _$GetRecentTransactionsState {
  const factory GetRecentTransactionsState.initial({
    List<GetAllTransactionsResponse>? getAllTransactionsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllTransactionsStatus,
}) = _Initial;
}
