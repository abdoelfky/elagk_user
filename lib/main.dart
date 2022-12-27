import 'package:device_preview/device_preview.dart';
import 'package:elagk/auth/presentation/controller/confim_password/confirm_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/forget_passord_controller/forget_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/login_controller/login_cubit.dart';
import 'package:elagk/auth/presentation/controller/otp_password/otp_password_cubit.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_cubit.dart';
import 'package:elagk/drawer/presentation/controller/complaints_controller/complaints_cubit.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/shared/bloc_observer.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/global/app_theme.dart';
import 'shared/utils/app_routes.dart';
import 'shared/utils/app_strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await initFCM(); // TODO: enable it after adding app notifications.
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  CacheHelper.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ),
  );
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // const MyApp._internal();
  //
  // static const MyApp instance = MyApp._internal();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (BuildContext context) =>LoginCubit()),
          BlocProvider(create: (BuildContext context) =>RegisterCubit()),
          BlocProvider(create: (BuildContext context) =>ForgetPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>ConfirmPasswordCubit()),
          BlocProvider(create: (BuildContext context) =>ComplaintsCubit()),
          BlocProvider(create: (BuildContext context) =>ProfileCubit()..getUserProfileData()),
          BlocProvider(create: (BuildContext context) =>OtpPasswordCubit()),

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

