class FinishOrderModel {
    FinishOrderModel({
        this.status,
        this.code,
        this.msg,
    });

    bool? status;
    int? code;
    String? msg;

    factory FinishOrderModel.fromJson(Map<String, dynamic>? json) => FinishOrderModel(
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
