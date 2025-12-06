part of 'get_all_customers_credit_report_cubit.dart';

@freezed
class GetAllCustomersCreditReportState with _$GetAllCustomersCreditReportState {
  const factory GetAllCustomersCreditReportState.initial({
    List<GetAllCustomersCreditReportResponse>? getAllCustomersCreditReportResponse,
    @Default(BooleanStatus.initial) BooleanStatus getAllCustomersCreditReportStatus,
}) = _Initial;
}
