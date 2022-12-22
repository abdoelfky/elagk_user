import 'package:elagk/auth/presentation/screens/forget_password_screen.dart';
import 'package:elagk/auth/presentation/screens/login_pharmacy_screen.dart';
import 'package:elagk/auth/presentation/screens/otp_verify_screen.dart';
import 'package:elagk/auth/presentation/screens/reset_password_screen.dart';
import 'package:elagk/drawer/presentation/components/drawer_widgets/home_drawer.dart';
import 'package:elagk/drawer/presentation/screens/add_medicine_screen.dart';
import 'package:elagk/drawer/presentation/screens/update_medicine_screen.dart';
import 'package:elagk/home/data/models/orders/open_image.dart';
import 'package:elagk/home/presentation/screens/home_page.dart';
import 'package:elagk/home/presentation/screens/one_order_details_screen.dart';
import 'package:elagk/notification/presentation/screens/notification.dart';
import 'package:elagk/opening/presentation/screens/offline_widget.dart';
import 'package:elagk/opening/presentation/screens/splash_screen.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/argument_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Routes {
  static const String home = '/';
  static const String notificationsScreen = '/notificationsScreen';
  static const String loginPharmacyScreen = '/loginPharmacyScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String homeDrawerScreen = '/homeDrawerScreen';
  static const String oneOrderDetailsScreen = '/oneOrderDetailsScreen';
  static const String imageSlideShow = '/imageSlideShow';
  static const String allOrdersScreen = '/allOrdersScreen';
  static const String addNewMedicinesScreen = '/addNewMedicinesScreen';
  static const String updateMedicineScreen = '/updateMedicineScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              final bool connected = connectivity != ConnectivityResult.none;
              if (connected) {
                return const SplashScreen();
              } else {
                return const OfflineWidget();
              }
            },
            child: const Center(child: CircularProgressIndicator()),
          ),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.loginPharmacyScreen:
        return MaterialPageRoute(builder: (_) => const LoginPharmacyScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.otpVerifyScreen:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as OTPArguments;
          return OTPVerifyScreen(email: args.email);
        });
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.homeDrawerScreen:
        return MaterialPageRoute(builder: (_) => const HomeDrawer());
      case Routes.oneOrderDetailsScreen:
        return MaterialPageRoute(builder: (_) => const OneOrderDetailsScreen());
      case Routes.imageSlideShow:
        return MaterialPageRoute(builder: (_) {
          final args = routeSettings.arguments as ImageSlideShowArguments;
          return ImageSlideShow(image: args.image);
        });
      case Routes.allOrdersScreen:
        return MaterialPageRoute(builder: (_) => const AllOrders());
      case Routes.addNewMedicinesScreen:
        return MaterialPageRoute(builder: (_) => const AddNewMedicines());
      case Routes.updateMedicineScreen:
        return MaterialPageRoute(
          builder: (_) {
            final args = routeSettings.arguments as UpdateMedicineArguments;
            return UpdateMedicineScreen(
              productId: args.productId,
              productName: args.productName,
              description: args.description,
              imageUrl: args.imageUrl,
              price: args.price,
              categoryId: args.categoryId,
              categoryName: args.categoryName,
              discountPercent: args.discountPercent,
              quantity: args.quantity,
              dose: args.dose,
            );
          },
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.wrongScreen),
        ),
        body: const Center(child: Text(AppStrings.routeNotFound)),
      ),
    );
  }
}
