import 'package:basic/app/escale/widgets/update_transaction_form/update_transaction_form_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'update_transaction_popup_content_state.dart';

part 'update_transaction_popup_content_cubit.freezed.dart';

class UpdateTransactionPopupContentCubit
    extends BaseCubit<UpdateTransactionPopupContentState> {
  UpdateTransactionPopupContentCubit({required super.context})
      : super(initialState: UpdateTransactionPopupContentState.initial(loadingButton: false));


  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }


}
