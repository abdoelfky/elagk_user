class AboutUsModel{
  String? whoAreWe;


  AboutUsModel({
    required this.whoAreWe,

  });

  AboutUsModel.fromJson(Map<String, dynamic> json){
    whoAreWe: json["whoAreWe"];
  }

  Map <String,dynamic> toMap()
  {
    return {
      'whoAreWe':whoAreWe,
    };
  }
}
