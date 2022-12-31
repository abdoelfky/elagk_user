import 'dart:async';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:elagk/shared/local/shared_preference.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    _controller = VideoPlayerController.asset(VideoAssets.splashIntro);
    _controller.initialize().then((_) {
      _controller.setLooping(false);
      Timer(const Duration(milliseconds: DurationConstant.d1000), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    print('ddddddddddddd');
    print(CacheHelper.getData(key: AppConstants.token));
    Future.delayed(const Duration(seconds: DurationConstant.d6), () {
      if(CacheHelper.getData(key: AppConstants.onBoarding)==null)
      {
        navigateFinalTo(
            context: context,
            screenRoute:Routes.onBoarding );
      }else
      {
        navigateFinalTo(
            context: context,
            screenRoute: CacheHelper.getData(key: AppConstants.token) == null
                ? Routes.loginScreen : Routes.homeDrawer );
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _visible ? AppSize.s1 : AppSize.s1,
              duration: const Duration(milliseconds: DurationConstant.d3000),
              child: VideoPlayer(_controller),
            ),
          ],
        ),
      ),
    );
  }
}
