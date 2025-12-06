import 'package:json_annotation/json_annotation.dart';

part 'create_return_transaction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateReturnTransactionResponse {

  factory CreateReturnTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReturnTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateReturnTransactionResponseToJson(this);

  CreateReturnTransactionResponse();
}
