import 'package:json_annotation/json_annotation.dart';

part 'get_all_customers_credit_report_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllCustomersCreditReportRequest {

  factory GetAllCustomersCreditReportRequest.fromJson(
      Map<String, dynamic> json) =>
      _$GetAllCustomersCreditReportRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllCustomersCreditReportRequestToJson(this);

  GetAllCustomersCreditReportRequest();
}
