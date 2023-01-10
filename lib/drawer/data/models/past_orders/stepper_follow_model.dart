class StepperFollowModel {
  bool? isAcceptedByPharmacy;
  bool? isAcceptedByDelivery;
  bool? isRejected;
  bool? isDelivered;
  DeliveryDetails? deliveryDetails;

  StepperFollowModel(
      {this.isAcceptedByPharmacy,
        this.isAcceptedByDelivery,
        this.isRejected,
        this.isDelivered,
        this.deliveryDetails});

  StepperFollowModel.fromJson(Map<String, dynamic> json) {
    isAcceptedByPharmacy = json['isAcceptedByPharmacy'];
    isAcceptedByDelivery = json['isAcceptedByDelivery'];
    isRejected = json['isRejected'];
    isDelivered = json['isDelivered'];
    deliveryDetails = json['deliveryDetails'] != null
        ? new DeliveryDetails.fromJson(json['deliveryDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAcceptedByPharmacy'] = this.isAcceptedByPharmacy;
    data['isAcceptedByDelivery'] = this.isAcceptedByDelivery;
    data['isRejected'] = this.isRejected;
    data['isDelivered'] = this.isDelivered;
    if (this.deliveryDetails != null) {
      data['deliveryDetails'] = this.deliveryDetails!.toJson();
    }
    return data;
  }
}

class DeliveryDetails {
  String? id;
  String? firstName;
  String? lastName;
  List<String>? phones;

  DeliveryDetails({this.id, this.firstName, this.lastName, this.phones});

  DeliveryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phones = json['phones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phones'] = this.phones;
    return data;
  }
}
