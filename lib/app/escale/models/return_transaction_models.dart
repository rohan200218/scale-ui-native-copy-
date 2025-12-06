import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_transaction_models.g.dart';

@JsonSerializable()
class ReturnTransactions {
  int? id;
  int? customerId;
  String? customerName;
  String? returnType;
  int? amountReturned;
  String? receipt;
  String? date;
  String? location;

  ReturnTransactions(
      {this.id,
        this.customerId,
        this.customerName,
        this.returnType,
        this.amountReturned,
        this.receipt,
        this.date, this.location});
  factory ReturnTransactions.fromJson(Map<String, dynamic> json) =>
        _$ReturnTransactionsFromJson(json);
  
    Map<String, dynamic> toJson() => _$ReturnTransactionsToJson(this);
  
}
