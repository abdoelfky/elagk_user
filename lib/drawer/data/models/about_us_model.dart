class AboutUsModel{
  String? whoAreWe;
  String? vision;


  AboutUsModel({
    this.whoAreWe,
    this.vision,
  });




  AboutUsModel.fromJson(Map<String, dynamic> json){
    whoAreWe: json["whoAreWe"];
    vision: json["vision"];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['whoAreWe'] = whoAreWe;
    data['vision'] = vision;
    return data;
  }

}