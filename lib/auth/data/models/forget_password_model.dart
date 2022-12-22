class ForgetPasswordModel{
  String? email;


  ForgetPasswordModel({
    required this.email,

  });

  ForgetPasswordModel.fromJson(Map<String, dynamic> json){
    email: json["email"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'email':email,
    };
  }
}
