import 'package:basic/app/escale/models/transaction_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_transactions_by_date_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetTransactionsByDateResponse extends Transactions{

  factory GetTransactionsByDateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionsByDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionsByDateResponseToJson(this);

  GetTransactionsByDateResponse();
}
