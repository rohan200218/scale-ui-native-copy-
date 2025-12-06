import 'package:basic/app/escale/request_response/bulk_update/bulk_update_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:basic/app/themes/toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../request_response/bulk_update/bulk_update_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bulk_update_price_popup_content_state.dart';

part 'bulk_update_price_popup_content_cubit.freezed.dart';

class BulkUpdatePricePopupContentCubit
    extends BaseCubit<BulkUpdatePricePopupContentState> {
  late TransactionService transactionService;

  BulkUpdatePricePopupContentCubit(
      {required super.context, int? customer, int? truck})
      : super(
            initialState: BulkUpdatePricePopupContentState.initial(
                customer: customer, truck: truck, loadingButton: false)) {
    transactionService = GetIt.instance<TransactionService>();
  }

  setConstPrice(String? price) => emit(state.copyWith(price: price));

  setLoadingButtonStatus(bool? val) {
    emitState(state.copyWith(loadingButton: val));
  }

  BulkUpdateRequest createRequestData(
      {int? customer, int? truck, String? price}) {
    final request = BulkUpdateRequest(
        customer: customer ?? state.customer,
        truck: truck ?? state.truck,
        price: price ?? state.price);
    return request;
  }

  Future<void> bulkUpdatePrice(BulkUpdateRequest request) async {
    return transactionService.bulkUpdatePrice(request).then((value) {
      emit(state.copyWith(bulkUpdatePriceStatus: BooleanStatus.success));
      showSuccessMessage("Price updated successfully");
      return value;
    }).catchError((error) {
      emit(state.copyWith(bulkUpdatePriceStatus: BooleanStatus.error));
      showErrorMessage("Failed to update CREDIT");
      throw error;
    });
  }
}
