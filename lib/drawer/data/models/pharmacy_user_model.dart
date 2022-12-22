class PharmacyUserModel{
  String? userId;
  int? pharmacyId;
  String? pharmacyName;
  String? pharmacyEmail;
  String? imageUrl;
  double? longitude;
  double? latitude;
  int? territoryId;

  PharmacyUserModel({
    required this.userId,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyEmail,
    required this.imageUrl,
    required this.longitude,
    required this.latitude,
    required this.territoryId,
  });

  PharmacyUserModel.fromJson(Map<String, dynamic> json){
    userId: json["userId"];
    pharmacyId: json["pharmacyId"];
    pharmacyName: json["pharmacyName"];
    pharmacyEmail: json["pharmacyEmail"];
    imageUrl: json["imageUrl"];
    longitude: json["longitude"];
    latitude: json["latitude"];
    territoryId: json["territoryId"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'userId': userId,
      'pharmacyId': pharmacyId,
      'pharmacyName': pharmacyName,
      'pharmacyEmail': pharmacyEmail,
      'imageUrl': imageUrl,
      'longitude': longitude,
      'latitude': latitude,
      'territoryId': territoryId,
    };
  }
}
