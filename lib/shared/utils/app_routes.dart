import 'package:elagk/auth/presentation/screens/login/login_screen.dart';
import 'package:elagk/auth/presentation/screens/register/presentation/register_user_screen.dart';
import 'package:elagk/opening/presentation/screens/offline_widget.dart';
import 'package:elagk/opening/presentation/screens/splash_screen.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/argument_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Routes {
  static const String home = '/';
  static const String notificationsScreen = '/notificationsScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
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
      // case Routes.notificationsScreen:
      //   return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      // case Routes.forgetPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      // case Routes.otpVerifyScreen:
      //   return MaterialPageRoute(builder: (_) {
      //     final args = routeSettings.arguments as OTPArguments;
      //     return OTPVerifyScreen(email: args.email);
      //   });
      // case Routes.resetPasswordScreen:
      //   return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      // case Routes.homeDrawerScreen:
      //   return MaterialPageRoute(builder: (_) => const HomeDrawer());
      // case Routes.oneOrderDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => const OneOrderDetailsScreen());


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
