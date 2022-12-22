import 'package:elagk_pharmacy/drawer/domain/entities/contact_us_entity.dart';

class ContactUsModel extends ContactUs {
  const ContactUsModel({
    required super.address,
    required super.phoneNumber,
    required super.email,
    required super.whatsApp,
    required super.facebook,
    required super.instagram,
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        whatsApp: json["whatsApp"],
        facebook: json["facebook"],
        instagram: json["instagram"],
      );
}
