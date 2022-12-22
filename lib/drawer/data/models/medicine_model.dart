import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';

class MedicineModel extends Medicine {
  const MedicineModel({
    required super.userId,
    required super.pharmacyId,
    required super.productId,
    required super.productName,
    required super.description,
    required super.price,
    required super.discountPercent,
    required super.imageUrl,
    required super.point,
    required super.categoryId,
    required super.categoryName,
    required super.quantity,
    required super.dose,
    required super.createdAt,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      userId: json["userId"],
      pharmacyId: json["pharmacyId"],
      productId: json["productId"],
      productName: json["productName"],
      description: json["description"],
      price: json["price"],
      discountPercent: json["discountPercent"],
      imageUrl: json["imageUrl"],
      point: json["point"],
      categoryId: json["categoryId"],
      categoryName: json["categoryName"],
      quantity: json["quantity"],
      dose: json["dose"],
      createdAt: json["createdAt"],
    );
  }
}
