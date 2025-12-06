import 'package:json_annotation/json_annotation.dart';

part 'update_transaction_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateTransactionResponse {

  factory UpdateTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTransactionResponseToJson(this);

  UpdateTransactionResponse();
}
