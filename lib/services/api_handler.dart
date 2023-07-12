import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter/consts/api_consts.dart';
import 'package:store_api_flutter/models/categories_model.dart';
import 'package:store_api_flutter/models/products_model.dart';
import 'package:store_api_flutter/models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target, String? limit}) async {
    try {
      Uri uri = Uri.https(
        kBaseUrl,
        "api/v1/$target",
        target == "products"
            ? {
                "offset": "0",
                "limit": limit,
              }
            : {},
      );
      var response = await http.get(uri);

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) throw data["message"];

      List tempList = [];
      for (var v in data) {
        tempList.add(v);
      }
      return tempList;
    } catch (e) {
      log("An error occured $e");
      throw e.toString();
    }
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      Uri uri = Uri.https(kBaseUrl, "api/v1/products/$id");
      var response = await http.get(uri);
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) throw data["message"];

      return ProductsModel.fromJson(data);
    } catch (e) {
      log("An error occured while getting product info $e");
      throw e.toString();
    }
  }

  static Future<List<ProductsModel>> getAllProducts({required String limit}) async {
    List temp = await getData(target: "products", limit: limit);
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");
    return UsersModel.usersFromSnapshot(temp);
  }
}
