class ProductModel {
  Null? userId;
  int? pharmacyId;
  int? productId;
  String? productName;
  String? description;
  double? price;
  double? discountPercent;
  String? imageUrl;
  Null? image;
  int? point;
  Null? categoryId;
  Null? categories;
  String? categoryName;
  int? quantity;
  String? dose;
  String? createdAt;

  ProductModel(
      {this.userId,
        this.pharmacyId,
        this.productId,
        this.productName,
        this.description,
        this.price,
        this.discountPercent,
        this.imageUrl,
        this.image,
        this.point,
        this.categoryId,
        this.categories,
        this.categoryName,
        this.quantity,
        this.dose,
        this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    pharmacyId = json['pharmacyId'];
    productId = json['productId'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    imageUrl = json['imageUrl'];
    image = json['image'];
    point = json['point'];
    categoryId = json['categoryId'];
    categories = json['categories'];
    categoryName = json['categoryName'];
    quantity = json['quantity'];
    dose = json['dose'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['pharmacyId'] = this.pharmacyId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercent'] = this.discountPercent;
    data['imageUrl'] = this.imageUrl;
    data['image'] = this.image;
    data['point'] = this.point;
    data['categoryId'] = this.categoryId;
    data['categories'] = this.categories;
    data['categoryName'] = this.categoryName;
    data['quantity'] = this.quantity;
    data['dose'] = this.dose;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
