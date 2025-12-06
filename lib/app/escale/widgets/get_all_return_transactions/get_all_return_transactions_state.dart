part of 'get_all_return_transactions_cubit.dart';

@freezed
class GetAllReturnTransactionsState with _$GetAllReturnTransactionsState {
  const factory GetAllReturnTransactionsState.initial({
    List<GetAllReturnTransactionsResponse>? getAllReturnTransactionsResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllReturnTransactionsStatus,
}) = _Initial;
}
