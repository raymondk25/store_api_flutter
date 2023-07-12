import 'categories_model.dart';

class ProductsModel {
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
}
