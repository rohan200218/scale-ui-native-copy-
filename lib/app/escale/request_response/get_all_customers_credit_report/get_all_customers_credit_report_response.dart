import 'package:json_annotation/json_annotation.dart';

import '../../models/customers_credit_models.dart';

part 'get_all_customers_credit_report_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllCustomersCreditReportResponse extends CustomerCreditReport{

  factory GetAllCustomersCreditReportResponse.fromJson(
      Map<String, dynamic> json) =>
      _$GetAllCustomersCreditReportResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAllCustomersCreditReportResponseToJson(this);

  GetAllCustomersCreditReportResponse();
}
