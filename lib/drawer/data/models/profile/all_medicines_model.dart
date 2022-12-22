class AllMedicines {
  AllMedicines({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  bool? status;
  int? code;
  String? msg;
  List<Datum>? data;

  factory AllMedicines.fromJson(Map<String, dynamic>? json) => AllMedicines(
    status: json?["status"],
    code: json?["code"],
    msg: json?["msg"],
    data: json?["data"] == null ? null : List<Datum>.from(json?["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Datum.fromJson(Map<String, dynamic>? json) => Datum(
    id: json?["id"],
    name: json?["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
