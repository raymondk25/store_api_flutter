import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter/consts/api_consts.dart';
import 'package:store_api_flutter/models/categories_model.dart';
import 'package:store_api_flutter/models/products_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    Uri uri = Uri.https(kBaseUrl, "api/v1/$target");
    var response = await http.get(uri);
    // print("response: ${jsonDecode(response.body)}");
    var data = jsonDecode(response.body);
    List tempList = [];
    for (var v in data) {
      tempList.add(v);
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: "products");
    return ProductsModel.productsFromSnapshot(temp);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }
}
