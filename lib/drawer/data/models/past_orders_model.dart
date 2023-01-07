class PastOrdersModel {
  int? orderId;
  bool? status;
  double? distance;
  double? destinationLatitude;
  double? destinationLongitude;
  String? address;
  double? fees;
  String? createdAt;
  String? updatedAt;
  double? totalPrice;
  Null? userId;
  int? pharmacyId;
  int? cartId;
  List<CartViews>? cartViews;

  PastOrdersModel(
      {this.orderId,
        this.status,
        this.distance,
        this.destinationLatitude,
        this.destinationLongitude,
        this.address,
        this.fees,
        this.createdAt,
        this.updatedAt,
        this.totalPrice,
        this.userId,
        this.pharmacyId,
        this.cartId,
        this.cartViews});

  PastOrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    status = json['status'];
    distance = json['distance'];
    destinationLatitude = json['destinationLatitude'];
    destinationLongitude = json['destinationLongitude'];
    address = json['address'];
    fees = json['fees'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalPrice = json['totalPrice'];
    userId = json['userId'];
    pharmacyId = json['pharmacyId'];
    cartId = json['cartId'];
    if (json['cartViews'] != null) {
      cartViews = <CartViews>[];
      json['cartViews'].forEach((v) {
        cartViews!.add(new CartViews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['status'] = this.status;
    data['distance'] = this.distance;
    data['destinationLatitude'] = this.destinationLatitude;
    data['destinationLongitude'] = this.destinationLongitude;
    data['address'] = this.address;
    data['fees'] = this.fees;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['totalPrice'] = this.totalPrice;
    data['userId'] = this.userId;
    data['pharmacyId'] = this.pharmacyId;
    data['cartId'] = this.cartId;
    if (this.cartViews != null) {
      data['cartViews'] = this.cartViews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartViews {
  int? cartId;
  int? productId;
  String? productName;
  String? categoryName;
  String? imageUrl;
  int? quantity;
  double? price;

  CartViews(
      {this.cartId,
        this.productId,
        this.productName,
        this.categoryName,
        this.imageUrl,
        this.quantity,
        this.price});

  CartViews.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    productId = json['productId'];
    productName = json['productName'];
    categoryName = json['categoryName'];
    imageUrl = json['imageUrl'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['categoryName'] = this.categoryName;
    data['imageUrl'] = this.imageUrl;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    return data;
  }
}
