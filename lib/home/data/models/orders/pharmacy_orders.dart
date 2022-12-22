
class PharmacyOrdersModel {
    PharmacyOrdersModel({
        this.status,
        this.code,
        this.msg,
        this.data,
    });

    bool? status;
    int? code;
    String? msg;
    List<Datumpharm>? data;

    factory PharmacyOrdersModel.fromJson(Map<String, dynamic>? json) => PharmacyOrdersModel(
        status: json?["status"],
        code: json?["code"],
        msg: json?["msg"],
        data: json?["data"] == null ? null : List<Datumpharm>.from(json?["data"].map((x) => Datumpharm.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datumpharm {
    Datumpharm({
        this.id,
        this.clientId,
        this.pharmacyId,
        this.deliveryId,
        this.deliveryType,
        this.paidType,
        this.description,
        this.photo,
        this.price,
        this.date,
        this.seen,
        this.type,
        this.status,
        this.latitude,
        this.longitude,
        this.address,
        this.couponId,
        this.couponAmount,
        this.priceAfterOffer,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    int? id;
    int? clientId;
    int? pharmacyId;
    dynamic deliveryId;
    int? deliveryType;
    int? paidType;
    String? description;
    dynamic photo;
    String? price;
    String? date;
    int? seen;
    int? type;
    int? status;
    double? latitude;
    double? longitude;
    String? address;
    dynamic couponId;
    dynamic couponAmount;
    String? priceAfterOffer;
    String? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    factory Datumpharm.fromJson(Map<String, dynamic> json) => Datumpharm(
        id: json["id"],
        clientId: json["client_id"],
        pharmacyId: json["pharmacy_id"],
        deliveryId: json["delivery_id"],
        deliveryType: json["delivery_type"],
        paidType: json["paid_type"],
        description: json["description"],
        photo: json["photo"],
        price: json["price"],
        date: json["date"],
        seen: json["seen"],
        type: json["type"],
        status: json["status"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        address: json["address"],
        couponId: json["coupon_id"],
        couponAmount: json["coupon_amount"],
        priceAfterOffer: json["price_after_offer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clientId,
        "pharmacy_id": pharmacyId,
        "delivery_id": deliveryId,
        "delivery_type": deliveryType,
        "paid_type": paidType,
        "description": description,
        "photo": photo,
        "price": price,
        "date": date,
        "seen": seen,
        "type": type,
        "status": status,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "coupon_id": couponId,
        "coupon_amount": couponAmount,
        "price_after_offer": priceAfterOffer,
        "created_at": createdAt,
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
