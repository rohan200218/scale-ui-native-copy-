import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'return_receipt_popup_content_state.dart';
part 'return_receipt_popup_content_cubit.freezed.dart';

class ReturnReceiptPopupContentCubit extends BaseCubit<ReturnReceiptPopupContentState> {
  ReturnReceiptPopupContentCubit({required super.context}) : super(initialState:ReturnReceiptPopupContentState.initial(loadingButton: false));
  
  
  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }
}
