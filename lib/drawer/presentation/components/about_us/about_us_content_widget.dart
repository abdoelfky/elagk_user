import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/about_us/about_us_text_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/about_us/about_us_title_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: BlocBuilder<AboutUsBloc, AboutUsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutUsTitle(
                  title: AppStrings.whoAreWe,
                  imageSrc: ImageAssets.info,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
                AboutUsText(description: state.aboutUsFirst!.whoAreWe),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s80),
                const AboutUsTitle(
                  title: AppStrings.ourVision,
                  imageSrc: ImageAssets.visibility,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
                AboutUsText(description: state.aboutUsSecond!.vision),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s80),
                const AboutUsTitle(
                  title: AppStrings.version,
                  imageSrc: ImageAssets.refresh,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
                const AboutUsText(description: AppStrings.versionNum),
              ],
            );
          },
        ),
      ),
    );
  }
}
