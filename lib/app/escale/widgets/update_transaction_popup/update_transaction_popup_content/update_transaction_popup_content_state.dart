part of 'update_transaction_popup_content_cubit.dart';

@freezed
class UpdateTransactionPopupContentState
    with _$UpdateTransactionPopupContentState {
  const factory UpdateTransactionPopupContentState.initial({
    bool? loadingButton,
    UpdateTransactionFormState? updateTransactionFormState
}) = _Initial;
}
