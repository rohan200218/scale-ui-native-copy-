import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/bulk_update/bulk_update_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bulk_update_cash_state.dart';

part 'bulk_update_cash_cubit.freezed.dart';

class BulkUpdateCashCubit extends BaseCubit<BulkUpdateCashState> {
  late TransactionService transactionService;
  BulkUpdateCashCubit({required super.context})
      : super(initialState: BulkUpdateCashState.initial()){
    transactionService=GetIt.instance<TransactionService>();
  }

    BulkUpdateRequest createRequestData({
    int? customer,
      int? truck
}) {
        final request = BulkUpdateRequest(
          customer: customer,
          truck: truck
        );
        return request;
      }

    Future<void> bulkUpdateToCash(
          BulkUpdateRequest request) async {
        return transactionService.bulkUpdateCash(request).then((value) {
          emit(state.copyWith(
              bulkUpdateCashStatus: BooleanStatus.success));
          showSuccessMessage("Updated to CASH");
          return value;
        }).catchError((error) {
          emit(state.copyWith(bulkUpdateCashStatus: BooleanStatus.error));
          showErrorMessage("Failed to update CASH");
          throw error;
        });
      }
}
