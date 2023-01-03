class BasketModel {
  int? productId;
  String? productName;
  String? imageUrl;
  double? price;
  int? quantity;


  BasketModel(
      {
        this.productId,
        this.productName,
        this.imageUrl,
        this.price,
        this.quantity,
      });

  BasketModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    quantity = json['quantity'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}
