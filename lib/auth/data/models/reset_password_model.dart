class ResetPasswordModel{
  String? message;


  ResetPasswordModel({
    required this.message,

  });

  ResetPasswordModel.fromJson(Map<String, dynamic> json){
    message: json["message"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'message':message,
    };
  }
}
