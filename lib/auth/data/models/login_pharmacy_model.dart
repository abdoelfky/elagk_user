import 'package:elagk_pharmacy/auth/domain/entities/login_pharmacy_entity.dart';

class LoginPharmacyModel extends LoginPharmacy{
    LoginPharmacyModel({
    required super.userId,
    super.message,
    required super.isAuthenticated,
    required super.username,
    required super.email,
    required super.roles,
    required super.token,
    required super.expiresOn,
    });

    factory LoginPharmacyModel.fromJson(Map<String, dynamic> json) => LoginPharmacyModel(
        userId: json["userId"],
        message: json["message"],
        isAuthenticated: json["isAuthenticated"],
        username: json["username"],
        email: json["email"],
        roles: json["roles"],
        token: json["token"],
        expiresOn: json["expiresOn"],
    );
}

