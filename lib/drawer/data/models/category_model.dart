class CategoryModel{
  int? categoryId;
  String? categoryName;
  String? imageUrl;
  String? createdAt;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
    required this.createdAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json){
    categoryId: json["categoryId"];
    categoryName: json["categoryName"];
    imageUrl: json["imageUrl"];
    createdAt: json["createdAt"];
  }

  Map <String,dynamic> toMap()
  {
    return {
    'categoryId': categoryId,
    'categoryName': categoryName,
    'imageUrl': imageUrl,
    'createdAt': createdAt,
    };
  }
}
