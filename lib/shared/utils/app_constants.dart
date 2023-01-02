import 'package:elagk/auth/data/models/login_model/login_model.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';

class AppConstants {
  // General
  static const String empty = "";
  static const String userName = "userName";


  // Cache helper
  static const String userId = "userId";
  static const String token = "token";
  static const String onBoarding = "onBoarding";

  static const String pharmacyId = "pharmacyId";
  static const String categoryId = "categoryId";
  static const String defaultCategory = "defaultCategory";
  static double? myLat;
  static double? myLong;
  static String pharmacyLocation = '';
  static String distance = '';
  static String currentLocation='';



  // About us Screen
  static const String whoAreWeParameter = "whoAreWe";
  static const String visionParameter = "vision";

  // Contact us screen
  static const String telScheme = 'tel'; // Phone number.
  static String locationUrl(String latitude, String longitude) => "geo:$latitude,$longitude"; // Location.
  static String emailUrl(String email) => "mailto:$email"; // Email.
  static const String whatsappMessage = "اهلا تطبيق علاجك 💚🔥"; // Phone number.
  static String whatsappUrlAndroid(String whatsApp) => "whatsapp://send?phone=+2$whatsApp&text=$whatsappMessage"; // Whatsapp android.
  static String whatsappUrlIos(String whatsApp) => "https://wa.me/$whatsApp?text=${Uri.tryParse(whatsappMessage)}"; // Whatsapp ios.
  static String facebookUrl(String facebook) => "https://m.facebook.com/$facebook"; // Facebook.
  static String instagramUrl(String instagram) => "https://www.instagram.com/$instagram/"; // Instagram.

}