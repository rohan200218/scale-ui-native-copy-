import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'create_return_transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateReturnTransactionRequest {
  int? customerId;
  int? amountReturned;
  String? returnType;
  String? latitude;
  String? longitude;

  @JsonKey(includeFromJson: false,includeToJson: false)
  List<File>? files;

  factory CreateReturnTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReturnTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReturnTransactionRequestToJson(this);

  CreateReturnTransactionRequest({this.latitude, this.longitude, this.returnType, this.customerId, this.files, this.amountReturned});
}
