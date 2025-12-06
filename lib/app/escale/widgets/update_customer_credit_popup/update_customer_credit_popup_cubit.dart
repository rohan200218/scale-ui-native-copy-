import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';
import '/app/core/modals/base_alert_popup/base_alert_popup_cubit.dart';

part 'update_customer_credit_popup_state.dart';

part 'update_customer_credit_popup_cubit.freezed.dart';

class UpdateCustomerCreditPopupCubit
    extends BaseAlertPopupCubit<UpdateCustomerCreditPopupState> {
  UpdateCustomerCreditPopupCubit({required super.context})
      : super(initialState: UpdateCustomerCreditPopupState.initial());


  @override
  void closePopup() {
    // TODO: implement closePopup
  }

  @override
  void openPopup() {
    emitState(state.copyWith(popupStatus: BooleanStatus.active));
  }

}
