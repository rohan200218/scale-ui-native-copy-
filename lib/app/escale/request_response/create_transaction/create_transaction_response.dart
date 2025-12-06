import 'package:json_annotation/json_annotation.dart';

part 'create_transaction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTransactionResponse {

  factory CreateTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTransactionResponseToJson(this);

  CreateTransactionResponse();
}
