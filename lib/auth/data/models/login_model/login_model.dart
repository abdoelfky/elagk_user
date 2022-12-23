class LoginModel {
  String? userId;
  Null? message;
  bool? isAuthenticated;
  String? username;
  String? email;
  List<String>? roles;
  String? token;
  String? expiresOn;

  LoginModel(
      {this.userId,
        this.message,
        this.isAuthenticated,
        this.username,
        this.email,
        this.roles,
        this.token,
        this.expiresOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    token = json['token'];
    expiresOn = json['expiresOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['message'] = message;
    data['isAuthenticated'] = isAuthenticated;
    data['username'] = username;
    data['email'] = email;
    data['roles'] = roles;
    data['token'] = token;
    data['expiresOn'] = expiresOn;
    return data;
  }
}