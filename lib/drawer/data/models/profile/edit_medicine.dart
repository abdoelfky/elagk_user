
class EditMEdicine {
  EditMEdicine({
    this.status,
    this.code,
    this.msg,
  });

  bool? status;
  int? code;
  String? msg;

  factory EditMEdicine.fromJson(Map<String, dynamic>? json) => EditMEdicine(
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
