import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'update_customer_credit_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateCustomerCreditRequest {
  int? customerId;
  int? price;
  int? newTotalCredit;
  // String? returnType;
  // String? latitude;
  // String? longitude;
  //
  // @JsonKey(includeFromJson: false,includeToJson: false)
  // List<File>? files;

  factory UpdateCustomerCreditRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerCreditRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerCreditRequestToJson(this);

  UpdateCustomerCreditRequest({this.customerId, this.price, this.newTotalCredit});
}
