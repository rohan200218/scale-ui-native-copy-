import 'package:basic/app/escale/request_response/get_all_customers_credit_report/get_all_customers_credit_report_response.dart';
import 'package:basic/app/escale/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../request_response/get_all_customers_credit_report/get_all_customers_credit_report_request.dart';
import '/app/core/blocs/base_cubit.dart';
import 'package:get_it/get_it.dart';
import '/app/core/database/boolean_status.dart';

part 'get_all_customers_credit_report_state.dart';

part 'get_all_customers_credit_report_cubit.freezed.dart';

class GetAllCustomersCreditReportCubit
    extends BaseCubit<GetAllCustomersCreditReportState> {
  late TransactionService transactionService;
  GetAllCustomersCreditReportCubit({required super.context})
      : super(initialState: GetAllCustomersCreditReportState.initial()){
    transactionService=GetIt.instance<TransactionService>();
    getAllCustomersCreditReport(createRequestData());
  }


    GetAllCustomersCreditReportRequest createRequestData() {
        final request = GetAllCustomersCreditReportRequest();
        return request;
      }

    Future<List<GetAllCustomersCreditReportResponse>> getAllCustomersCreditReport(
          GetAllCustomersCreditReportRequest request) async {
        return transactionService.getAllCustomersCreditReport(request).then((value) {
          emit(state.copyWith(
              getAllCustomersCreditReportResponse: value,
              getAllCustomersCreditReportStatus: BooleanStatus.success));
          return Future.value(value);
        }).catchError((error) {
          emit(state.copyWith(getAllCustomersCreditReportStatus: BooleanStatus.error));
          throw error;
        });
      }
}
