import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/about_us_components/about_us_text_widget.dart';
import 'package:elagk/drawer/presentation/components/about_us_components/about_us_title_widget.dart';
import 'package:elagk/drawer/presentation/controller/about_us_controller/about_us_cubit.dart';
import 'package:elagk/drawer/presentation/controller/about_us_controller/about_us_state.dart';
import 'package:elagk/drawer/presentation/controller/contact_us_controller/contact_us_cubit.dart';
import 'package:elagk/drawer/presentation/controller/contact_us_controller/contact_us_state.dart';import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: BlocConsumer<AboutUsCubit, AboutUsState>(
          listener: (context, state)
          {
            // if(state is GetAboutUsErrorState)
            // {
            //   AboutUsCubit.get(context).getAboutUsWhoWeAre();
            //   AboutUsCubit.get(context).getAboutUsVision();
            // }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AboutUsTitle(
                  title: AppStrings.whoAreWe,
                  imageSrc: ImageAssets.info,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
                AboutUsText(description: AboutUsCubit.get(context).whoWeAre!.message!),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s80),
                const AboutUsTitle(
                  title: AppStrings.ourVision,
                  imageSrc: ImageAssets.visibility,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
                AboutUsText(description: AboutUsCubit.get(context).vision!.message!),
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
