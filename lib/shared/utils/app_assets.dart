const String IMAGE_PATH = 'assets/images';
const String JSON_PATH = 'assets/json';
const String VIDEO_PATH = 'assets/video';

class ImageAssets {
  // General
  static const String logo = '$IMAGE_PATH/splash/logo.png';
  static const String elagkWord = '$IMAGE_PATH/login/3elagk_word.png';
  static const String background = '$IMAGE_PATH/login/background.png';
  static const String errorImage = '$IMAGE_PATH/about_us/info(1)@3x.png';

  // Offline screen
  static const String connectionLost = '$IMAGE_PATH/connectionLost.png';

  // Main drawer || Drawer icons
  static const String menuIcon = '$IMAGE_PATH/bold_menu_icon.png';
  static const String home = '$IMAGE_PATH/drawer_icons/home.svg';
  static const String user = '$IMAGE_PATH/drawer_icons/user.svg';
  static const String complaints = '$IMAGE_PATH/drawer_icons/complaint.svg';
  static const String contactUs = '$IMAGE_PATH/drawer_icons/contact-us.svg';
  static const String aboutUs = '$IMAGE_PATH/drawer_icons/about-us.svg';
  static const String logout = '$IMAGE_PATH/drawer_icons/logout.svg';


  // About us screen
  static const String info = '$IMAGE_PATH/about_us/info(1).png';
  static const String visibility = '$IMAGE_PATH/about_us/visibility.png';
  static const String refresh = '$IMAGE_PATH/about_us/refresh.png';

  // Contact us screen
  static const String address = '$IMAGE_PATH/contact_us/address.png';
  static const String whatsapp = '$IMAGE_PATH/contact_us/whatsapp.png';
  static const String gmail = '$IMAGE_PATH/contact_us/gmail.png';
  static const String call = '$IMAGE_PATH/contact_us/call.png';
  static const String facebook = '$IMAGE_PATH/contact_us/facebook.jpg';
  static const String instagram = '$IMAGE_PATH/contact_us/instagram.png';

  // Pharmacy user profile  screen
  static const String mapPin = '$IMAGE_PATH/profile/map-pin.png';
  static const String between = '$IMAGE_PATH/profile/between.png';
  static const String order = '$IMAGE_PATH/profile/order.png';

  // One order details screen
  static const String mapBackground = '$IMAGE_PATH/order/bg-map.png';

  // All orders screen
  static const String customer = '$IMAGE_PATH/order/4140048@3x.png';

  // Add & update medicine screen
  static const String importImage = '$IMAGE_PATH/import-image.png';
  static const String deleteIcon = '$IMAGE_PATH/delete_ic.svg';
}

class JsonAssets {
  // Offline screen
  static const String noInternet = '$JSON_PATH/no-internet.json';
  // Notifications screen
  static const String noNotifications = '$JSON_PATH/no-notification.json';
  // Home screen
  static const String ordersDone = '$JSON_PATH/orders-done.json';
}

class VideoAssets {
  // splash screen
  static const String splashIntro = '$VIDEO_PATH/intro.mp4';
}
