import 'package:elagk_pharmacy/auth/domain/entities/forget_password_entity.dart';

class ForgetPasswordModel extends ForgetPassword {
  const ForgetPasswordModel({required super.email});

  factory ForgetPasswordModel.fromJson(String jsonData) =>
      ForgetPasswordModel(email: jsonData);
}
