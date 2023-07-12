import 'package:flutter/cupertino.dart';

import 'categories_model.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoriesModel? category;

  ProductsModel(
      {this.id, this.title, this.price, this.description, this.images, this.creationAt, this.updatedAt, this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null ? CategoriesModel.fromJson(json['category']) : null;
  }

  static List<ProductsModel> productsFromSnapshot(List productSnapshot) {
    return productSnapshot.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
