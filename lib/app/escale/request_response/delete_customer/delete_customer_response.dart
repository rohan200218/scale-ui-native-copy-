import 'package:json_annotation/json_annotation.dart';

part 'delete_customer_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteCustomerResponse {

  factory DeleteCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCustomerResponseToJson(this);

  DeleteCustomerResponse();
}
