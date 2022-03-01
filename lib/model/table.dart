// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

TableModel tableModelFromJson(String str) => TableModel.fromJson(json.decode(str));

String tableModelToJson(TableModel data) => json.encode(data.toJson());

class TableModel {
  TableModel({
    required this.success,
    this.data,
    required this.message,
  });

  bool success;
  List<Datum>? data;
  String message;

  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.tableNo,
    this.bookingStatus,
  });

  int? id;
  int? tableNo;
  String? bookingStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tableNo: json["table_no"],
        bookingStatus: json["booking_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_no": tableNo,
        "booking_status": bookingStatus,
      };
}
