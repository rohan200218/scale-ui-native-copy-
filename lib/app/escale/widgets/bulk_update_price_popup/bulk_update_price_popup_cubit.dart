import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import '/app/core/modals/base_alert_popup/base_alert_popup_cubit.dart';

part 'bulk_update_price_popup_state.dart';

part 'bulk_update_price_popup_cubit.freezed.dart';

class BulkUpdatePricePopupCubit
    extends BaseAlertPopupCubit<BulkUpdatePricePopupState> {
  BulkUpdatePricePopupCubit({required super.context})
      : super(initialState: BulkUpdatePricePopupState.initial());


  @override
  void closePopup() {
    // TODO: implement closePopup
  }

  @override
  void openPopup() {
    emitState(state.copyWith(popupStatus: BooleanStatus.active));
  }

}
