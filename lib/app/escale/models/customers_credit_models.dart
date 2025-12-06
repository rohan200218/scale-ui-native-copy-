
import 'package:basic/app/escale/models/item_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customers_credit_models.g.dart';

@JsonSerializable()
class CustomerCreditReport {
  int? customerId;
  String? customerName;
  List<Items>? items;

  CustomerCreditReport({this.customerId, this.customerName, this.items});

  factory CustomerCreditReport.fromJson(Map<String, dynamic> json) =>
        _$CustomerCreditReportFromJson(json);

    Map<String, dynamic> toJson() => _$CustomerCreditReportToJson(this);
  }

@JsonSerializable()
class Items {
  String? item;
  int? price;
  int? totalBags;
  int? totalWeight;
  int? totalCredit;
  String? createdAt;

  Items(
      {this.item,
        this.price,
        this.totalBags,
        this.totalWeight,
        this.totalCredit, this.createdAt});
  
    factory Items.fromJson(Map<String, dynamic> json) =>
          _$ItemsFromJson(json);
    
      Map<String, dynamic> toJson() => _$ItemsToJson(this);
    
}
