import 'package:json_annotation/json_annotation.dart';

part 'update_customer_credit_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateCustomerCreditResponse {

  factory UpdateCustomerCreditResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerCreditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerCreditResponseToJson(this);

  UpdateCustomerCreditResponse();
}
