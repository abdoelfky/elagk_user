class CategoriesModel {
  int? categoryId;
  String? categoryName;
  String? imageUrl;
  String? createdAt;
  String? image;

  CategoriesModel(
      {this.categoryId,
        this.categoryName,
        this.imageUrl,
        this.createdAt,
        this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categoryId'] = categoryId;
    data['categoryName'] =categoryName;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    data['image'] = image;
    return data;
  }
}
