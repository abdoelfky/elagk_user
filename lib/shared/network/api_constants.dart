class ApiConstants {
  // Api.
  static const String baseUrl = "http://freelancerr-001-site1.btempurl.com/api";
  static const String auth = "Auth";

  // End points | Paths.
  // Login pharmacy screen
  static const String login = "$baseUrl/$auth/Login";

  // Forget password screen
  static const String forgetPassword = "$baseUrl/$auth/Forgetpassword";

  static String forgetPasswordEmailPath(String email) =>
      "$forgetPassword/$email";

  static const String sendMail = "$baseUrl/$auth/SendMail";

  // Activate email screen
  static const String activation = "$baseUrl/$auth/Activation";

  static String activationCodePath(int code) => "$activation/$code";

  // Reset password screen
  static const String resetPassword = "$baseUrl/$auth/ResetPassword";

  // About us screen
  static const String aboutUs = "$baseUrl/AboutUs";
  static String aboutUsTypePath(String type) => "$aboutUs/$type";
  // Contact us screen
  static const String contactUs = "$aboutUs/GetContactUs";

  // Add medicine screen
  static const String products = "$baseUrl/Products";

  // Pharmacy user profile screen
  static String productIdPath(int productId) => "$products/$productId";
  static const String productsByCategoryAndID =
      "$products/GetPharmacyProductByCategory";

  static String productsByCategoryAndIDPath(int pharmacyId, String categoryName) => "$productsByCategoryAndID/$pharmacyId/$categoryName";
  static const String pharmacies = "$baseUrl/Pharmacies";
  static const String userPharmacy = "$pharmacies/UserPharmacy";

  static String pharmacyUserIdPath(String userId) => "$userPharmacy/$userId";
  static const String categories = "$baseUrl/Categories";

  // Complaints screen
  static const String complaints = "$baseUrl/Issues";
}
