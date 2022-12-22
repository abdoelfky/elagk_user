class PharmacyMedicinesModel {
    PharmacyMedicinesModel({
        this.status,
        this.code,
        this.msg,
        this.paginate,
    });

    bool? status;
    int? code;
    String? msg;
    Paginate? paginate;

    factory PharmacyMedicinesModel.fromJson(Map<String, dynamic>? json) => PharmacyMedicinesModel(
        status: json?["status"],
        code: json?["code"],
        msg: json?["msg"],
        paginate: json?["paginate"] == null ? null : Paginate.fromJson(json?["paginate"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "paginate": paginate == null ? null : paginate!.toJson(),
    };
}

class Paginate {
    Paginate({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    int? currentPage;
    List<ActiveMedi>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    factory Paginate.fromJson(Map<String, dynamic>? json) => Paginate(
        currentPage: json?["current_page"],
        data: json?["data"] == null ? null : List<ActiveMedi>.from(json?["data"].map((x) => ActiveMedi.fromJson(x))),
        firstPageUrl: json?["first_page_url"],
        from: json?["from"],
        lastPage: json?["last_page"],
        lastPageUrl: json?["last_page_url"],
        links: json?["links"] == null ? null : List<Link>.from(json?["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json?["next_page_url"],
        path: json?["path"],
        perPage: json?["per_page"],
        prevPageUrl: json?["prev_page_url"],
        to: json?["to"],
        total: json?["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? null : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class ActiveMedi {
    ActiveMedi({
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

    factory ActiveMedi.fromJson(Map<String, dynamic>? json) => ActiveMedi(
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

class Link {
    Link({
        this.url,
        this.label,
        this.active,
    });

    String? url;
    String? label;
    bool? active;

    factory Link.fromJson(Map<String, dynamic>? json) => Link(
        url: json?["url"],
        label: json?["label"],
        active: json?["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
