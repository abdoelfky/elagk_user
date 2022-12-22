class EmailActivationModel{
  String? message;


  EmailActivationModel({
    required this.message,

  });

  EmailActivationModel.fromJson(Map<String, dynamic> json){
    message: json["message"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'message':message,
    };
  }
}
