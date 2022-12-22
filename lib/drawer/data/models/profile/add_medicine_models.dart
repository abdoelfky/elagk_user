class AddMedicineModel {
  AddMedicineModel({
    this.status,
    this.code,
    this.msg,
  });

  bool? status;
  int? code;
  String? msg;

  factory AddMedicineModel.fromJson(Map<String, dynamic>? json) => AddMedicineModel(
    status: json?["status"],
    code: json?["code"],
    msg: json?["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
  };
}
