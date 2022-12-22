import 'package:elagk_pharmacy/auth/domain/entities/email_activation_entity.dart';

class EmailActivationModel extends EmailActivation {
  const EmailActivationModel({required super.message});

  factory EmailActivationModel.fromJson(Map<String, dynamic> json) =>
      EmailActivationModel(
        message: json['message'],
      );
}
