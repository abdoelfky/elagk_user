    class ReportOrderModel {
      ReportOrderModel({
        this.status,
        this.code,
        this.msg,
    });

    bool? status;
    int? code;
    String? msg;

    factory ReportOrderModel.fromJson(Map<String, dynamic>? json) => ReportOrderModel(
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