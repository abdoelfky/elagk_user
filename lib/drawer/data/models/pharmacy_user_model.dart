import 'package:elagk_pharmacy/drawer/domain/entities/pharmacy_user_entity.dart';

class PharmacyUserModel extends PharmacyUser {
  const PharmacyUserModel({
    required super.userId,
    required super.pharmacyId,
    required super.pharmacyName,
    required super.pharmacyEmail,
    required super.imageUrl,
    required super.longitude,
    required super.latitude,
    required super.territoryId,
    // required super.phones,
  });

  factory PharmacyUserModel.fromJson(Map<String, dynamic> json) {
    return PharmacyUserModel(
      userId: json["userId"],
      pharmacyId: json["pharmacyId"],
      pharmacyName: json["pharmacyName"],
      pharmacyEmail: json["pharmacyEmail"],
      imageUrl: json["imageUrl"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      territoryId: json["territoryId"],
      // phones: json["phones"], // used in user app only
    );
  }
}
