class OnePharmacyModel {
    OnePharmacyModel({
        this.status,
        this.code,
        this.msg,
        this.data,
    });

    bool? status;
    int? code;
    String? msg;
    Data? data;

    factory OnePharmacyModel.fromJson(Map<String, dynamic>? json) => OnePharmacyModel(
        status: json?["status"],
        code: json?["code"],
        msg: json?["msg"],
        data: json?["data"] == null ? null : Data.fromJson(json?["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.phone1,
        this.phone2,
        this.photo,
        this.owner,
        this.description,
        this.address,
        this.location,
        this.active,
        this.orderByPhoto,
        this.deviceToken,
        this.areaId,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.deliveryTime,
        this.departments,
        this.activeMedicines,
        this.distance,
        this.area,
    });

    int? id;
    String? name;
    String? email;
    String? phone1;
    String? phone2;
    String? photo;
    String? owner;
    String? description;
    String? address;
    String? location;
    int? active;
    int? orderByPhoto;
    String? deviceToken;
    int? areaId;
    double? latitude;
    double? longitude;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? deliveryTime;
    List<Department>? departments;
    List<ActiveMedicine>? activeMedicines;
    int? distance;
    Area? area;

    factory Data.fromJson(Map<String, dynamic>? json) => Data(
        id: json?["id"],
        name: json?["name"],
        email: json?["email"],
        phone1: json?["phone1"],
        phone2: json?["phone2"],
        photo: json?["photo"],
        owner: json?["owner"],
        description: json?["description"],
        address: json?["address"],
        location: json?["location"],
        active: json?["active"],
        orderByPhoto: json?["order_by_photo"],
        deviceToken: json?["device_token"],
        areaId: json?["area_id"],
        latitude: json?["latitude"] == null ? null : json?["latitude"].toDouble(),
        longitude: json?["longitude"] == null ? null : json?["longitude"].toDouble(),
        createdAt: json?["created_at"] == null ? null : DateTime.parse(json?["created_at"]),
        updatedAt: json?["updated_at"] == null ? null : DateTime.parse(json?["updated_at"]),
        deletedAt: json?["deleted_at"],
        deliveryTime: json?["delivery_time"],
        departments: json?["departments"] == null ? null : List<Department>.from(json?["departments"].map((x) => Department.fromJson(x))),
        activeMedicines: json?["active_medicines"] == null ? null : List<ActiveMedicine>.from(json?["active_medicines"].map((x) => ActiveMedicine.fromJson(x))),
        distance: json?["distance"],
        area: json?["area"] == null ? null : Area.fromJson(json?["area"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone1": phone1,
        "phone2": phone2,
        "photo": photo,
        "owner": owner,
        "description": description,
        "address": address,
        "location": location,
        "active": active,
        "order_by_photo": orderByPhoto,
        "device_token": deviceToken,
        "area_id": areaId,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "delivery_time": deliveryTime,
        "departments": departments == null ? null : List<dynamic>.from(departments!.map((x) => x.toJson())),
        "active_medicines": activeMedicines == null ? null : List<dynamic>.from(activeMedicines!.map((x) => x.toJson())),
        "distance": distance,
        "area": area == null ? null : area!.toJson(),
    };
}

class ActiveMedicine {
    ActiveMedicine({
        this.id,
        this.name,
        this.photo,
        this.description,
        this.active,
        this.departmentId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.price,
        this.pivot,
    });

    int? id;
    String? name;
    String? photo;
    String? description;
    int? active;
    int? departmentId;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? price;
    Pivot? pivot;

    factory ActiveMedicine.fromJson(Map<String, dynamic>? json) => ActiveMedicine(
        id: json?["id"],
        name: json?["name"],
        photo: json?["photo"],
        description: json?["description"],
        active: json?["active"],
        departmentId: json?["department_id"],
        createdAt: json?["created_at"] == null ? null : DateTime.parse(json?["created_at"]),
        updatedAt: json?["updated_at"] == null ? null : DateTime.parse(json?["updated_at"]),
        deletedAt: json?["deleted_at"],
        price: json?["price"],
        pivot: json?["pivot"] == null ? null : Pivot.fromJson(json?["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "description": description,
        "active": active,
        "department_id": departmentId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "price": price,
        "pivot": pivot == null ? null : pivot!.toJson(),
    };
}

class Pivot {
    Pivot({
        this.pharmacyId,
        this.medicineId,
        this.id,
        this.price,
        this.amount,
        this.active,
    });

    int? pharmacyId;
    int? medicineId;
    int? id;
    String? price;
    String? amount;
    int? active;

    factory Pivot.fromJson(Map<String, dynamic>? json) => Pivot(
        pharmacyId: json?["pharmacy_id"],
        medicineId: json?["medicine_id"],
        id: json?["id"],
        price: json?["price"],
        amount: json?["amount"],
        active: json?["active"],
    );

    Map<String, dynamic> toJson() => {
        "pharmacy_id": pharmacyId,
        "medicine_id": medicineId,
        "id": id,
        "price": price,
        "amount": amount,
        "active": active,
    };
}

class Area {
    Area({
        this.id,
        this.name,
        this.cityId,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    int? cityId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Area.fromJson(Map<String, dynamic>? json) => Area(
        id: json?["id"],
        name: json?["name"],
        cityId: json?["city_id"],
        createdAt: json?["created_at"] == null ? null : DateTime.parse(json?["created_at"]),
        updatedAt: json?["updated_at"] == null ? null : DateTime.parse(json?["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city_id": cityId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}

class Department {
    Department({
        this.id,
        this.name,
    });

    int? id;
    String? name;

    factory Department.fromJson(Map<String, dynamic>? json) => Department(
        id: json?["id"],
        name: json?["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
