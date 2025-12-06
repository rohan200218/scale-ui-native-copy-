import 'package:json_annotation/json_annotation.dart';

part 'delete_transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteTransactionRequest {
  int? transactionid;

  factory DeleteTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteTransactionRequestToJson(this);

  DeleteTransactionRequest({this.transactionid});
}
