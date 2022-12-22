import 'package:elagk_pharmacy/drawer/domain/entities/category_entity.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.categoryId,
    required super.categoryName,
    required super.imageUrl,
    required super.createdAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      imageUrl: json["imageUrl"],
      createdAt: json["createdAt"],
    );
  }
}
