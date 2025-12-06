// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      id: (json['id'] as num?)?.toInt(),
      items: json['items'] as String?,
      bags: (json['bags'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      purchasetype: json['purchasetype'] as String?,
      price: (json['price'] as num?)?.toInt(),
      uom: json['uom'] as String?,
      isdeleted: json['isdeleted'] as bool?,
      enteredvia: json['enteredvia'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      truckid: (json['truckid'] as num?)?.toInt(),
      customerid: (json['customerid'] as num?)?.toInt(),
      shopId: (json['shopId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      truck: json['truck'] == null
          ? null
          : Truck.fromJson(json['truck'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
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
      'customer': instance.customer,
      'truck': instance.truck,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
    };

Truck _$TruckFromJson(Map<String, dynamic> json) => Truck(
      number: json['number'] as String?,
    );

Map<String, dynamic> _$TruckToJson(Truck instance) => <String, dynamic>{
      'number': instance.number,
    };
