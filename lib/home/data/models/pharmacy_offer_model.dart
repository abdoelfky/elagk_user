class PharmacyOfferModel {
  String? userId;
  int? pharmacyId;
  String? pharmacyName;
  String? pharmacyEmail;
  String? imageUrl;
  double? longitude;
  double? latitude;
  int? territoryId;
  Null? image;
  List<String>? phones;

  PharmacyOfferModel(
      {this.userId,
        this.pharmacyId,
        this.pharmacyName,
        this.pharmacyEmail,
        this.imageUrl,
        this.longitude,
        this.latitude,
        this.territoryId,
        this.image,
        this.phones});

  PharmacyOfferModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    pharmacyId = json['pharmacyId'];
    pharmacyName = json['pharmacyName'];
    pharmacyEmail = json['pharmacyEmail'];
    imageUrl = json['imageUrl'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    territoryId = json['territoryId'];
    image = json['image'];
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['pharmacyId'] = this.pharmacyId;
    data['pharmacyName'] = this.pharmacyName;
    data['pharmacyEmail'] = this.pharmacyEmail;
    data['imageUrl'] = this.imageUrl;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['territoryId'] = this.territoryId;
    data['image'] = this.image;
    data['phones'] = this.phones;
    return data;
  }
}
