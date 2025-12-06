part of 'bulk_update_cash_cubit.dart';

@freezed
class BulkUpdateCashState with _$BulkUpdateCashState {
  const factory BulkUpdateCashState.initial({
    @Default(BooleanStatus.initial) BooleanStatus bulkUpdateCashStatus,
}) = _Initial;
}
