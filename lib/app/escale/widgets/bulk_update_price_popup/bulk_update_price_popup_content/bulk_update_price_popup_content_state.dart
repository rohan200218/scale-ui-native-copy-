part of 'bulk_update_price_popup_content_cubit.dart';

@freezed
class BulkUpdatePricePopupContentState with _$BulkUpdatePricePopupContentState {
  const factory BulkUpdatePricePopupContentState.initial({
    @Default(BooleanStatus.initial) BooleanStatus bulkUpdatePriceStatus,
    String? price,
    int? customer,
    int? truck,
    bool? loadingButton,
}) = _Initial;
}
