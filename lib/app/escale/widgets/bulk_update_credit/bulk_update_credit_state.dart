part of 'bulk_update_credit_cubit.dart';

@freezed
class BulkUpdateCreditState with _$BulkUpdateCreditState {
  const factory BulkUpdateCreditState.initial({
    @Default(BooleanStatus.initial) BooleanStatus bulkUpdateStatus,
}) = _Initial;
}
