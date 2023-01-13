import 'package:device_preview/device_preview.dart';
import 'package:elagk/auth/presentation/controller/activator/activator_cubit.dart';
import 'package:elagk/auth/presentation/controller/confim_password/confirm_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/forget_passord_controller/forget_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/login_controller/login_cubit.dart';
import 'package:elagk/auth/presentation/controller/otp_password/otp_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_cubit.dart';
import 'package:elagk/auth/presentation/controller/reset_password_controller/reset_password_cubit.dart';
import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/drawer/presentation/controller/about_us_controller/about_us_cubit.dart';
import 'package:elagk/drawer/presentation/controller/contact_us_controller/contact_us_cubit.dart';
import 'package:elagk/drawer/presentation/controller/complaints_controller/complaints_cubit.dart';
import 'package:elagk/drawer/presentation/controller/elagk_store_controller/elagk_store_cubit.dart';
import 'package:elagk/drawer/presentation/controller/past_orders_controller/past_orders_cubit.dart';
import 'package:elagk/drawer/presentation/controller/points_controller/points_cubit.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/drawer/presentation/controller/special_customers_controller/special_cutomers_cubit.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/onboarding/controllers/onboarding_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_cubit.dart';
import 'package:elagk/shared/bloc_observer.dart';
import 'package:elagk/shared/config/noti.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'pharmacy/presentation/pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_cubit.dart';
import 'pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'shared/global/app_theme.dart';
import 'shared/utils/app_routes.dart';
import 'shared/utils/app_strings.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await initFCM(); \ TODO: enable it after adding app notifications.

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CacheHelper.init();
  Noti.initialize(flutterLocalNotificationsPlugin);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  );

  runApp(DevicePreview(enabled: !kReleaseMode,
      builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (BuildContext context) =>OnboardingCubit()),
          BlocProvider(create: (BuildContext context) =>LoginCubit()),
          BlocProvider(create: (BuildContext context) =>RegisterCubit()),
          BlocProvider(create: (BuildContext context) =>ForgetPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>ResetPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>OtpPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>ConfirmPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>ComplaintsCubit()),
          BlocProvider(create: (BuildContext context) =>ProfileCubit()..getUserProfileData()),
          BlocProvider(create: (BuildContext context) =>ContactUsCubit()..getContactUs()),
          BlocProvider(create: (BuildContext context) =>AboutUsCubit()..getAboutUs()),
          BlocProvider(create: (BuildContext context) =>BasketCubit()),
          BlocProvider(create: (BuildContext context) =>ActivatorCubit()),
          BlocProvider(create: (BuildContext context) =>CategoriesCubit()),
          BlocProvider(create: (BuildContext context) =>HomeScreenCubit()..getUserProfileData()..getPermission()..getOffers()..getNotifications()..checkNotifications()),
          BlocProvider(create: (BuildContext context) =>OrderByPerscripiyionCubit()),
          BlocProvider(create: (BuildContext context) =>PastOrdersCubit()..getPastOrders()),
          BlocProvider(create: (BuildContext context) =>PharmacyProductiesCubit()),
          BlocProvider(create: (BuildContext context) =>PointsCubit()..getProducts()..getUserPoints()),
          BlocProvider(create: (BuildContext context) =>SpecialCustomersCubit()..getSpecialCustomers()),
          BlocProvider(create: (BuildContext context) =>ElagkStoreCubit()
            ..getCategories(SuperCategoryId: 1)),
          BlocProvider(create: (BuildContext context) =>StepperCubit()),




        ],
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: lightTheme,
      title: AppStrings.appTitle,
    )
    );

  }
}

