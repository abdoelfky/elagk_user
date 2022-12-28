import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/contact_us_components/contactus_container_widget.dart';
import 'package:elagk/drawer/presentation/components/contact_us_components/space_widget.dart';
import 'package:elagk/drawer/presentation/controller/about_us_controller/about_us_cubit.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: BlocBuilder<AboutUsCubit, AboutUsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactUsContainer(
                  title: AppStrings.address,
                  imageSrc: ImageAssets.address,
                  details:'شارع شرم الشيخ العويسي خان الخليل',
                  onTap: () {

                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.phoneNumber,
                  imageSrc: ImageAssets.call,
                  details: '010101212',
                  onTap: () {

                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.emailAddress,
                  imageSrc: ImageAssets.gmail,
                  details:'elagk@gmail.com',
                  onTap: () {

                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.whatsapp,
                  imageSrc: ImageAssets.whatsapp,
                  details:'+201012151417',
                  onTap: () {


                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.facebook,
                  imageSrc: ImageAssets.facebook,
                  details: 'elagk',
                  onTap: () {

                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.instagram,
                  imageSrc: ImageAssets.instagram,
                  details: 'elagk',
                  onTap: () {

                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
