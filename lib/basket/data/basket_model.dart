class BasketModel {
  int? productId;
  String? productName;
  String? imageUrl;
  double? price;


  BasketModel(
      {
        this.productId,
        this.productName,
        this.imageUrl,
        this.price,
      });

  BasketModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    price = json['price'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    return data;
  }
}
