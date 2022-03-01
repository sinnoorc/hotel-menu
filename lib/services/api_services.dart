import 'package:flutter/cupertino.dart';
import 'package:hotel_menu/constants/app_url.dart';
import 'package:hotel_menu/model/category.dart';
import 'package:hotel_menu/model/product.dart';
import 'package:hotel_menu/model/table.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var timeLimit = const Duration(seconds: 30);

class ApiServices {
  static Future<TableModel> getTableList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    try {
      var uri = Uri.parse(ConstUrl.tableListUrl);
      var response = await http.get(uri, headers: {'Authorization': 'Bearer $token'}).timeout(timeLimit);
      // statusCode = response.statusCode.toString();
      Logger().w(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Logger().v(jsonResponse);
        return TableModel.fromJson(jsonResponse);
      }
    } catch (e) {
      AppException.fetchError(e);
      Logger().e(e);
    }
    throw Exception('Error');
  }

  static Future<CategoryModel> getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    try {
      var uri = Uri.parse(ConstUrl.getAllCategoriesUrl);
      var response = await http.get(uri, headers: {'Authorization': 'Bearer $token'}).timeout(timeLimit);
      // statusCode = response.statusCode.toString();
      Logger().w(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Logger().v(jsonResponse);
        return CategoryModel.fromJson(jsonResponse);
      }
    } catch (e) {
      AppException.fetchError(e);
    }
    throw FlutterError('Failed to get table list');
  }

  static Future<ProductModel> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    try {
      var uri = Uri.parse(ConstUrl.getAllProductsUrl);
      var response = await http.get(uri, headers: {'Authorization': 'Bearer $token'}).timeout(timeLimit);
      // statusCode = response.statusCode.toString();
      Logger().w(response.statusCode);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Logger().v(jsonResponse);
        return ProductModel.fromJson(jsonResponse);
      }
    } catch (e) {
      AppException.fetchError(e);
    }
    throw FlutterError('Failed to get table list');
  }
}
