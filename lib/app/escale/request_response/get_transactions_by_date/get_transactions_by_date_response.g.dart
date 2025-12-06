// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transactions_by_date_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionsByDateResponse _$GetTransactionsByDateResponseFromJson(
        Map<String, dynamic> json) =>
    GetTransactionsByDateResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..items = json['items'] as String?
      ..bags = (json['bags'] as num?)?.toInt()
      ..weight = (json['weight'] as num?)?.toInt()
      ..purchasetype = json['purchasetype'] as String?
      ..price = (json['price'] as num?)?.toInt()
      ..uom = json['uom'] as String?
      ..isdeleted = json['isdeleted'] as bool?
      ..enteredvia = json['enteredvia'] as String?
      ..createdAt = json['createdAt'] as String?
      ..updatedAt = json['updatedAt'] as String?
      ..truckid = (json['truckid'] as num?)?.toInt()
      ..customerid = (json['customerid'] as num?)?.toInt()
      ..shopId = (json['shopId'] as num?)?.toInt()
      ..userId = (json['userId'] as num?)?.toInt()
      ..customer = json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>)
      ..truck = json['truck'] == null
          ? null
          : Truck.fromJson(json['truck'] as Map<String, dynamic>);

Map<String, dynamic> _$GetTransactionsByDateResponseToJson(
        GetTransactionsByDateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.items,
      'bags': instance.bags,
      'weight': instance.weight,
      'purchasetype': instance.purchasetype,
      'price': instance.price,
      'uom': instance.uom,
      'isdeleted': instance.isdeleted,
      'enteredvia': instance.enteredvia,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'truckid': instance.truckid,
      'customerid': instance.customerid,
      'shopId': instance.shopId,
      'userId': instance.userId,
      'customer': instance.customer?.toJson(),
      'truck': instance.truck?.toJson(),
    };
