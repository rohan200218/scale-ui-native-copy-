part of 'update_customer_credit_popup_content_cubit.dart';

@freezed
class UpdateCustomerCreditPopupContentState
    with _$UpdateCustomerCreditPopupContentState {
  const factory UpdateCustomerCreditPopupContentState.initial({
    required int customerId,
    String? item,
    String? newTotalCredit,
    String? returnType,
    bool? loadingButton,
    Position? position,
    required List<String> files,
    @Default(BooleanStatus.initial) BooleanStatus filePickerStatus,
    @Default(BooleanStatus.initial) BooleanStatus updateCustomerCreditStatus,
    CreateTransactionResponse? createTransactionResponse,
    @Default(BooleanStatus.initial) BooleanStatus createTransactionStatus,
  }) = _Initial;
}
