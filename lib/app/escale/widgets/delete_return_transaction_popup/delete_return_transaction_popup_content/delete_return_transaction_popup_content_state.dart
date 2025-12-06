part of 'delete_return_transaction_popup_content_cubit.dart';

@freezed
class DeleteReturnTransactionPopupContentState
    with _$DeleteReturnTransactionPopupContentState {
  const factory DeleteReturnTransactionPopupContentState.initial({
    bool? loadingButton,
    int? transactionid,
    @Default(BooleanStatus.initial) BooleanStatus deleteTransactionStatus,
  }) = _Initial;
}
