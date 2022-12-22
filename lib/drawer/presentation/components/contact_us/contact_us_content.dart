import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/contact_us/contactus_container_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/contact_us/space_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsContent extends StatelessWidget {
  const ContactUsContent({Key? key}) : super(key: key);

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
                ContactUsContainer(
                  title: AppStrings.address,
                  imageSrc: ImageAssets.address,
                  details: state.contactUs!.address,
                  onTap: () {
                    /*context.read<AboutUsBloc>().add(
                          const ContactUsViaLocationEvent(
                            latitude: "42.3540", // TODO: For test.
                            longitude: "71.0586", // TODO: For test.
                          ),
                        );*/
                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.phoneNumber,
                  imageSrc: ImageAssets.call,
                  details: state.contactUs!.phoneNumber,
                  onTap: () {
                    context.read<AboutUsBloc>().add(
                          const ContactUsViaCallEvent(),
                        );
                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.emailAddress,
                  imageSrc: ImageAssets.gmail,
                  details: state.contactUs!.email,
                  onTap: () {
                    context.read<AboutUsBloc>().add(
                          ContactUsViaEmailEvent(state.contactUs!.email),
                        );
                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.whatsapp,
                  imageSrc: ImageAssets.whatsapp,
                  details: state.contactUs!.whatsApp,
                  onTap: () {

                      context.read<AboutUsBloc>().add(
                            ContactUsViaWhatsappEvent(
                              context: context,
                              whatsApp: state.contactUs!.whatsApp,
                            ),
                          );
                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.facebook,
                  imageSrc: ImageAssets.facebook,
                  details: state.contactUs!.facebook,
                  onTap: () {
                    context.read<AboutUsBloc>().add(
                          ContactUsViaFacebookEvent(state.contactUs!.facebook),
                        );
                  },
                ),
                const SpaceWidget(),
                ContactUsContainer(
                  title: AppStrings.instagram,
                  imageSrc: ImageAssets.instagram,
                  details: state.contactUs!.instagram,
                  onTap: () {
                    context.read<AboutUsBloc>().add(
                          ContactUsViaInstagramEvent(state.contactUs!.instagram),
                        );
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
