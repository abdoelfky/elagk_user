class CategoryModel {
  int? categoryId;
  String? categoryName;
  String? imageUrl;
  Null? image;
  String? createdAt;
  int? superCategoryId;
  Null? superCategory;

  CategoryModel(
      {this.categoryId,
        this.categoryName,
        this.imageUrl,
        this.image,
        this.createdAt,
        this.superCategoryId,
        this.superCategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    imageUrl = json['imageUrl'];
    image = json['image'];
    createdAt = json['createdAt'];
    superCategoryId = json['superCategoryId'];
    superCategory = json['superCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['imageUrl'] = this.imageUrl;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['superCategoryId'] = this.superCategoryId;
    data['superCategory'] = this.superCategory;
    return data;
  }
}
