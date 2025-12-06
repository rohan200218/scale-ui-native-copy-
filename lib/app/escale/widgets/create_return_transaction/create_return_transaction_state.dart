part of 'create_return_transaction_cubit.dart';

@freezed
class CreateReturnTransactionState with _$CreateReturnTransactionState {
  const factory CreateReturnTransactionState.initial({
    CreateReturnTransactionResponse? createReturnTransactionResponse,
    @Default(BooleanStatus.initial) BooleanStatus createReturnTransactionStatus,
}) = _Initial;
}
