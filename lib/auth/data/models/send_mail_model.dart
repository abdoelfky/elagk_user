class SendMailModel{
  String? message;


  SendMailModel({
    required this.message,

  });

  SendMailModel.fromJson(Map<String, dynamic> json){
    message: json["message"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'message':message,
    };
  }
}
