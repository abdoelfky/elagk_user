class ContactUsModel{
  String? address;
  String? phoneNumber;
  String? email;
  String? whatsApp;
  String? facebook;
  String? instagram;

  ContactUsModel({
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.whatsApp,
    required this.facebook,
    required this.instagram,
  });

  ContactUsModel.fromJson(Map<String, dynamic> json){
    address: json["address"];
    phoneNumber: json["phoneNumber"];
    email: json["email"];
    whatsApp: json["whatsApp"];
    facebook: json["facebook"];
    instagram: json["instagram"];
  }

  Map <String,dynamic> toMap()
  {
    return {
    'address': address,
    'phoneNumber': phoneNumber,
    'email': email,
    'whatsApp': whatsApp,
    'facebook': facebook,
    'instagram': instagram,
    };
  }
}
