part of 'update_transaction_form_cubit.dart';

@freezed
class UpdateTransactionFormState with _$UpdateTransactionFormState {
  const factory UpdateTransactionFormState.initial({
  ControlStatus? formValid,
    Customers? selectedCustomer,
    String? purchaseType,
    required Transactions transaction,
    @Default(BooleanStatus.initial) BooleanStatus updateTransactionStatus,
  }) = _Initial;
}
