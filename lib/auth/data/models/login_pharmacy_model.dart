
class LoginPharmacyModel{
  String? userId;
  String? message;
  bool? isAuthenticated;
  String? username;
  String? email;
  List<dynamic>? roles;
  String? token;
  String? expiresOn;

  LoginPharmacyModel({
    required this.userId,
    this.message,
    required this.isAuthenticated,
    required this.username,
    required this.email,
    required this.roles,
    required this.token,
    required this.expiresOn,
  });

  LoginPharmacyModel.fromJson(Map<String, dynamic> json){
    userId: json["userId"];
    message: json["message"];
    isAuthenticated: json["isAuthenticated"];
    username: json["username"];
    email: json["email"];
    roles: json["roles"];
    token: json["token"];
    expiresOn: json["expiresOn"];
      }

  Map <String,dynamic> toMap()
  {
    return {
      'userId':userId,
      'message':message,
      'isAuthenticated':isAuthenticated,
      'username':username,
      'email':email,
      'roles':roles,
      'token':token,
      'expiresOn':expiresOn,
    };
  }
}
