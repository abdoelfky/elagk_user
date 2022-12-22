/*
class PharmacyProfileModel {
  PharmacyProfileModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });
  bool? status;
  int? code;
  String? msg;
  Data? data;

  PharmacyProfileModel.fromJson(Map<String, dynamic>? json){
    status = json!['status'];
    code = json['code'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['msg'] = msg;
    _data['data'] = data!.toJson();
    return _data;
  }
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
  bool? active;
  bool? orderByPhoto;
  String? deviceToken;
  int? areaId;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Departments>? departments;
  List<ActiveMedicines>? activeMedicines;
  int? distance;
  Area? area;

  Data.fromJson(Map<String, dynamic>? json){
    id = json!['id'];
    name = json['name'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    photo = json['photo'];
    owner = json['owner'];
    description = json['description'];
    address = json['address'];
    location = json['location'];
    active = json['active'];
    orderByPhoto = json['order_by_photo'];
    deviceToken = json['device_token'];
    areaId = json['area_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    departments = List.from(json['departments']).map((e)=>Departments.fromJson(e)).toList();
    activeMedicines = List.from(json['active_medicines']).map((e)=>ActiveMedicines.fromJson(e)).toList();
    distance = json['distance'];
    area = Area.fromJson(json['area']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone1'] = phone1;
    _data['phone2'] = phone2;
    _data['photo'] = photo;
    _data['owner'] = owner;
    _data['description'] = description;
    _data['address'] = address;
    _data['location'] = location;
    _data['active'] = active;
    _data['order_by_photo'] = orderByPhoto;
    _data['device_token'] = deviceToken;
    _data['area_id'] = areaId;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['departments'] = departments!.map((e)=>e.toJson()).toList();
    _data['active_medicines'] = activeMedicines!.map((e)=>e.toJson()).toList();
    _data['distance'] = distance;
    _data['area'] = area!.toJson();
    return _data;
  }
}

class Departments {
  Departments({
    this.id,
    this.name,
  });
  int? id;
  String? name;

  Departments.fromJson(Map<String, dynamic>? json){
    id = json!['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class ActiveMedicines {
  ActiveMedicines({
    this.id,
    this.name,
    this.photo,
    this.description,
    this.active,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.pivot,
  });
  int? id;
  String? name;
  String? photo;
  String? description;
  bool? active;
  int? departmentId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Pivot? pivot;

  ActiveMedicines.fromJson(Map<String, dynamic>? json){
    id = json!['id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    active = json['active'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['photo'] = photo;
    _data['description'] = description;
    _data['active'] = active;
    _data['department_id'] = departmentId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['pivot'] = pivot!.toJson();
    return _data;
  }
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
  bool? active;

  Pivot.fromJson(Map<String, dynamic>? json){
    pharmacyId = json!['pharmacy_id'];
    medicineId = json['medicine_id'];
    id = json['id'];
    price = json['price'];
    amount = json['amount'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pharmacy_id'] = pharmacyId;
    _data['medicine_id'] = medicineId;
    _data['id'] = id;
    _data['price'] = price;
    _data['amount'] = amount;
    _data['active'] = active;
    return _data;
  }
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
  String? createdAt;
  String? updatedAt;

  Area.fromJson(Map<String, dynamic>? json){
    id = json!['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city_id'] = cityId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}*/

/*class PharmacyProfileModel {
  PharmacyProfileModel({
    required this.status,
    required this.code,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final int code;
  late final String msg;
  late final Data data;

  PharmacyProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone1,
    required this.phone2,
    required this.photo,
    required this.owner,
    required this.description,
    required this.address,
    required this.location,
    required this.active,
    required this.orderByPhoto,
    required this.deviceToken,
    required this.areaId,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.departments,
    required this.activeMedicines,
    required this.distance,
    required this.area,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone1;
  late final String phone2;
  late final String photo;
  late final String owner;
  late final String description;
  late final String address;
  late final String location;
  late final bool active;
  late final bool orderByPhoto;
  late final String deviceToken;
  late final int areaId;
  late final String latitude;
  late final String longitude;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final List<Departments> departments;
  late final List<ActiveMedicines> activeMedicines;
  late final int distance;
  late final Area area;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    photo = json['photo'];
    owner = json['owner'];
    description = json['description'];
    address = json['address'];
    location = json['location'];
    active = json['active'];
    orderByPhoto = json['order_by_photo'];
    deviceToken = json['device_token'];
    areaId = json['area_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    departments = List.from(json['departments']).map((e)=>Departments.fromJson(e)).toList();
    activeMedicines = List.from(json['active_medicines']).map((e)=>ActiveMedicines.fromJson(e)).toList();
    distance = json['distance'];
    area = Area.fromJson(json['area']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone1'] = phone1;
    _data['phone2'] = phone2;
    _data['photo'] = photo;
    _data['owner'] = owner;
    _data['description'] = description;
    _data['address'] = address;
    _data['location'] = location;
    _data['active'] = active;
    _data['order_by_photo'] = orderByPhoto;
    _data['device_token'] = deviceToken;
    _data['area_id'] = areaId;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['departments'] = departments.map((e)=>e.toJson()).toList();
    _data['active_medicines'] = activeMedicines.map((e)=>e.toJson()).toList();
    _data['distance'] = distance;
    _data['area'] = area.toJson();
    return _data;
  }
}

class Departments {
  Departments({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Departments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class ActiveMedicines {
  ActiveMedicines({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.active,
    required this.departmentId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.pivot,
  });
  late final int id;
  late final String name;
  late final String photo;
  late final String description;
  late final bool active;
  late final int departmentId;
  late final String createdAt;
  late final String updatedAt;
  late final String deletedAt;
  late final Pivot pivot;

  ActiveMedicines.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    active = json['active'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['photo'] = photo;
    _data['description'] = description;
    _data['active'] = active;
    _data['department_id'] = departmentId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.pharmacyId,
    required this.medicineId,
    required this.id,
    required this.price,
    required this.amount,
    required this.active,
  });
  late final int pharmacyId;
  late final int medicineId;
  late final int id;
  late final String price;
  late final String amount;
  late final bool active;

  Pivot.fromJson(Map<String, dynamic> json){
    pharmacyId = json['pharmacy_id'];
    medicineId = json['medicine_id'];
    id = json['id'];
    price = json['price'];
    amount = json['amount'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pharmacy_id'] = pharmacyId;
    _data['medicine_id'] = medicineId;
    _data['id'] = id;
    _data['price'] = price;
    _data['amount'] = amount;
    _data['active'] = active;
    return _data;
  }
}

class Area {
  Area({
    required this.id,
    required this.name,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int cityId;
  late final String createdAt;
  late final String updatedAt;

  Area.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city_id'] = cityId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}*/