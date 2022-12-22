class MedicineModel{
  String? userId;
  int? pharmacyId;
  int? productId;
  String? productName;
  String? description;
  double? price;
  double? discountPercent;
  String? imageUrl;
  int? point;
  int? categoryId;
  String? categoryName;
  int? quantity;
  String? dose;
  String? createdAt;

  MedicineModel({
    required this.userId,
    required this.pharmacyId,
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.discountPercent,
    required this.imageUrl,
    required this.point,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    required this.dose,
    required this.createdAt,
  });

  MedicineModel.fromJson(Map<String, dynamic> json){
    userId: json["userId"];
    pharmacyId: json["pharmacyId"];
    productId: json["productId"];
    productName: json["productName"];
    description: json["description"];
    price: json["price"];
    discountPercent: json["discountPercent"];
    imageUrl: json["imageUrl"];
    point: json["point"];
    categoryId: json["categoryId"];
    categoryName: json["categoryName"];
    quantity: json["quantity"];
    dose: json["dose"];
    createdAt: json["createdAt"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'userId': userId,
      'pharmacyId': pharmacyId,
      'productId': productId,
      'productName': productName,
      'description': description,
      'price': price,
      'discountPercent': discountPercent,
      'imageUrl': imageUrl,
      'point': point,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'quantity': quantity,
      'dose': dose,
      'createdAt': createdAt,
    };
  }
}
