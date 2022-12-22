
import 'package:elagk_pharmacy/auth/domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPassword {
  const ResetPasswordModel({required super.message});

  factory ResetPasswordModel.fromJson(String jsonData) => ResetPasswordModel(
    message: jsonData,
  );
}
