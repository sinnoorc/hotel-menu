// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.result,
    required this.message,
     this.data,
  });

  bool result;
  String message;
  List<Datum>? data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        result: json["result"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.productName,
    this.categoryId,
    this.salePrice,
    this.regularPrice,
    this.description,
    this.productStatus,
    this.position,
    this.image1,
    this.image2,
    this.image3,
    this.image4,
    this.stockQty,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? productName;
  String? categoryId;
  String? salePrice;
  String? regularPrice;
  String? description;
  String? productStatus;
  String? position;
  String? image1;
  dynamic image2;
  dynamic image3;
  dynamic image4;
  String? stockQty;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productName: json["product_name"],
        categoryId: json["category_id"],
        salePrice: json["sale_price"],
        regularPrice: json["regular_price"],
        description: json["description"],
        productStatus: json["product_status"],
        position: json["position"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        stockQty: json["stock_qty"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedBy: json["updated_by"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "category_id": categoryId,
        "sale_price": salePrice,
        "regular_price": regularPrice,
        "description": description,
        "product_status": productStatus,
        "position": position,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "stock_qty": stockQty,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_by": updatedBy,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
