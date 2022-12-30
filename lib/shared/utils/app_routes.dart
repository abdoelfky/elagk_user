import 'package:elagk/auth/presentation/screens/forget_password/otp_password_screen.dart';
import 'package:elagk/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:elagk/auth/presentation/screens/login/login_screen.dart';
import 'package:elagk/auth/presentation/screens/register/register_user_screen.dart';
import 'package:elagk/drawer/presentation/components/home_drawe_widget.dart';
import 'package:elagk/drawer/presentation/screens/basket_screen.dart';
import 'package:elagk/drawer/presentation/screens/edit_profile_screen.dart';
import 'package:elagk/home/presentation/screens/home_screen.dart';
import 'package:elagk/home/presentation/screens/offers_screen.dart';
import 'package:elagk/opening/presentation/screens/offline_widget.dart';
import 'package:elagk/opening/presentation/screens/splash_screen.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/screens/categories_screen/categories_screen.dart';
import 'package:elagk/pharmacy/presentation/screens/pharmacy_screens/OrderByPrescriptionScreen.dart';
import 'package:elagk/pharmacy/presentation/screens/pharmacy_screens/phamacy_screen.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/argument_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../auth/presentation/screens/vrification/activator_screen.dart';

class Routes {
  static const String home = '/';
  static const String basketScreen = '/BasketScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String homeScreen = '/homeScreen';
  static const String oneOrderDetailsScreen = '/oneOrderDetailsScreen';
  static const String homeDrawer = '/HomeDrawer';
  static const String pharmacy = '/PharmacyScreen';
  static const String editProfileScreen = '/EditProfileScreen';
  static const String offersScreen = '/OffersScreen';
  static const String otpPasswordScreen = '/OtpPasswordScreen';

  static const String categories = '/CategoriesScreen';
  static const String allOrdersScreen = '/allOrdersScreen';
  static const String addNewMedicinesScreen = '/addNewMedicinesScreen';
  static const String orderByPrescription = '/OrderByPrescriptionScreen';
  static const String confirmPasswordScreen = '/confirmPasswordScreen';
  static const String activator = '/ActivatorScreen';
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
    case Routes.editProfileScreen:
      return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) =>  RegisterScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.confirmPasswordScreen:
        return MaterialPageRoute(builder: (_) => OtpPasswordScreen());
      case Routes.activator:
        return MaterialPageRoute(builder: (_) => ActivatorScreen());
        case Routes.offersScreen:
      return MaterialPageRoute(builder: (_) => OffersScreen());
      case Routes.otpPasswordScreen:
        return MaterialPageRoute(builder: (_) => OtpPasswordScreen());
      case Routes.orderByPrescription:
      return MaterialPageRoute(builder: (_) => const OrderByPrescriptionScreen());
    case Routes.pharmacy:
      return MaterialPageRoute(builder: (_) {
        final pharmacyModel = routeSettings.arguments as PharmacyModel;
        // final pharmacyLocation = routeSettings.arguments as String;

        return PharmacyScreen(pharmacyModel:pharmacyModel ,);
      });
      case Routes.homeDrawer:
        return MaterialPageRoute(builder: (_) => const HomeDrawer());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case Routes.categories:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
    case Routes.basketScreen:
      return MaterialPageRoute(builder: (_) => const BasketScreen());


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
