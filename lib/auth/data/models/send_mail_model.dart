import 'package:elagk_pharmacy/auth/domain/entities/send_mail_entity.dart';

class SendMailModel extends SendMail {
  const SendMailModel({required super.message});

  factory SendMailModel.fromJson(Map<String, dynamic> json) => SendMailModel(
        message: json['message'],
      );
}
