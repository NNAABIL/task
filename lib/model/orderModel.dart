// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

class OrderModel {
  OrderModel({
     this.orders,
  });

  List<Order> orders;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orders: json["orders"] == null ? null : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );
}

class Order {
  Order({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  });

  String id;
  bool isActive;
  String price;
  String company;
  String picture;
  String buyer;
  List<String> tags;
  String status;
  String registered;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        price: json["price"] == null ? null : json["price"],
        company: json["company"] == null ? null : json["company"],
        picture: json["picture"] == null ? null : json["picture"],
        buyer: json["buyer"] == null ? null : json["buyer"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        registered: json["registered"] == null ? null : json["registered"],
      );
}
