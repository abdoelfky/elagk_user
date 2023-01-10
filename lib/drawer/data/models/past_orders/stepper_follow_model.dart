class StepperFollowModel {
  bool? isAcceptedByPharmacy;
  bool? isAcceptedByDelivery;
  bool? isDelivered;

  StepperFollowModel(
      {this.isAcceptedByPharmacy, this.isAcceptedByDelivery, this.isDelivered});

  StepperFollowModel.fromJson(Map<String, dynamic> json) {
    isAcceptedByPharmacy = json['isAcceptedByPharmacy'];
    isAcceptedByDelivery = json['isAcceptedByDelivery'];
    isDelivered = json['isDelivered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAcceptedByPharmacy'] = this.isAcceptedByPharmacy;
    data['isAcceptedByDelivery'] = this.isAcceptedByDelivery;
    data['isDelivered'] = this.isDelivered;
    return data;
  }
}
