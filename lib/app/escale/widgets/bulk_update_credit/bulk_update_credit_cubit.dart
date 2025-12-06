import 'package:basic/app/escale/request_response/bulk_update/bulk_update_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/bulk_update/bulk_update_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'bulk_update_credit_state.dart';

part 'bulk_update_credit_cubit.freezed.dart';

class BulkUpdateCreditCubit extends BaseCubit<BulkUpdateCreditState> {
  late TransactionService transactionService;
  BulkUpdateCreditCubit({required super.context})
      : super(initialState: BulkUpdateCreditState.initial()){
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

    Future<void> bulkUpdateCredit(
          BulkUpdateRequest request) async {
        return transactionService.bulkUpdateCredit(request).then((value) {
          emit(state.copyWith(
              bulkUpdateStatus: BooleanStatus.success));
          showSuccessMessage("Updated to CREDIT");
          return value;
        }).catchError((error) {
          emit(state.copyWith(bulkUpdateStatus: BooleanStatus.error));
          showErrorMessage("Failed to update CREDIT");
          throw error;
        });
      }

}
