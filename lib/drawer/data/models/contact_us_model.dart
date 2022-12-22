import 'package:elagk_pharmacy/drawer/domain/entities/about_us_entity.dart';

class AboutUsFirstModel extends AboutUsFirst {
  const AboutUsFirstModel({required super.whoAreWe});

  factory AboutUsFirstModel.fromJson(Map<String, dynamic> json) =>
      AboutUsFirstModel(whoAreWe: json["message"]);
}

class AboutUsSecondModel extends AboutUsSecond {
  const AboutUsSecondModel({required super.vision});

  factory AboutUsSecondModel.fromJson(Map<String, dynamic> json) =>
      AboutUsSecondModel(vision: json["message"]);
}
