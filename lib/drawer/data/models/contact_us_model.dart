class ContactUsModel{
  String? address;
  String? phoneNumber;
  String? email;
  String? whatsApp;
  String? facebook;
  String? instagram;

  ContactUsModel({
    this.address,
    this.phoneNumber,
    this.email,
    this.whatsApp,
    this.facebook,
    this.instagram,
  });




  ContactUsModel.fromJson(Map<String, dynamic> json){
    address: json["address"];
    phoneNumber: json["phoneNumber"];
    email: json["email"];
    whatsApp: json["whatsApp"];
    facebook: json["facebook"];
    instagram: json["instagram"];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['whatsApp'] = whatsApp;
    data['facebook'] = facebook;
    data['instagram'] = instagram;
    return data;
  }

}