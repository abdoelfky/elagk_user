class SpecialCustomerModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePicturePath;
  int? point;
  double? totalPrice;

  SpecialCustomerModel(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.profilePicturePath,
        this.point,
        this.totalPrice});

  SpecialCustomerModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profilePicturePath = json['profilePicturePath'];
    point = json['point'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['profilePicturePath'] = this.profilePicturePath;
    data['point'] = this.point;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
