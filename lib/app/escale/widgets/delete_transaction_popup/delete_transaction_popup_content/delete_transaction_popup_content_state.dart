part of 'delete_transaction_popup_content_cubit.dart';

@freezed
class DeleteTransactionPopupContentState
    with _$DeleteTransactionPopupContentState {
  const factory DeleteTransactionPopupContentState.initial({
    bool? loadingButton,
    int? transactionid,
    @Default(BooleanStatus.initial) BooleanStatus deleteTransactionStatus,
  }) = _Initial;
}
