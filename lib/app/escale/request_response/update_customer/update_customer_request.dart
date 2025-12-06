import 'package:json_annotation/json_annotation.dart';

part 'update_customer_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateCustomerRequest {

  factory UpdateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerRequestToJson(this);

  UpdateCustomerRequest();
}
