import 'package:json_annotation/json_annotation.dart';

part 'get_transactions_by_date_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTransactionsByDateRequest {
  String? date;

  factory GetTransactionsByDateRequest.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionsByDateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionsByDateRequestToJson(this);

  GetTransactionsByDateRequest({this.date});
}
