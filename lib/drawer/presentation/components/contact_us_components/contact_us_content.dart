import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/contact_us_components/contactus_container_widget.dart';
import 'package:elagk/drawer/presentation/components/contact_us_components/space_widget.dart';
import 'package:elagk/drawer/presentation/controller/contact_us_controller/contact_us_cubit.dart';
import 'package:elagk/drawer/presentation/controller/contact_us_controller/contact_us_state.dart';import 'package:elagk/shared/utils/app_assets.dart';
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
        child: BlocConsumer<ContactUsCubit, ContactUsState>(
            listener: (context, state)
            {
              if(state is GetContactUsErrorState)
              {
                ContactUsCubit.get(context).getContactUs();
              }
            } ,
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactUsContainer(
                    title: AppStrings.address,
                    imageSrc: ImageAssets.address,
                    details:ContactUsCubit.get(context).contactUsModel!.address.toString(),
                    onTap: () {
                    ContactUsCubit.get(context).openMap(30.164064,31.551225);

                    },
                  ),
                  const SpaceWidget(),
                  ContactUsContainer(
                    title: AppStrings.phoneNumber,
                    imageSrc: ImageAssets.call,
                    details:ContactUsCubit.get(context).contactUsModel!.phoneNumber.toString(),
                    onTap: () {
                      ContactUsCubit.get(context).phoneCall();

                    },
                  ),
                  const SpaceWidget(),
                  ContactUsContainer(
                    title: AppStrings.emailAddress,
                    imageSrc: ImageAssets.gmail,
                    details:ContactUsCubit.get(context).contactUsModel!.email.toString(),
                    onTap: () {
                      ContactUsCubit.get(context).gmail();

                    },
                  ),
                  const SpaceWidget(),
                  ContactUsContainer(
                    title: AppStrings.whatsapp,
                    imageSrc: ImageAssets.whatsapp,
                    details:ContactUsCubit.get(context).contactUsModel!.whatsApp.toString(),
                    onTap: () {
                      ContactUsCubit.get(context).whatsApp();


                    },
                  ),
                  const SpaceWidget(),
                  ContactUsContainer(
                    title: AppStrings.facebook,
                    imageSrc: ImageAssets.facebook,
                    details: ContactUsCubit.get(context).contactUsModel!.facebook.toString(),
                    onTap: () {
                      ContactUsCubit.get(context).faceBook();

                    },
                  ),
                  const SpaceWidget(),
                  ContactUsContainer(
                    title: AppStrings.instagram,
                    imageSrc: ImageAssets.instagram,
                    details: ContactUsCubit.get(context).contactUsModel!.instagram.toString(),
                    onTap: () {
                      ContactUsCubit.get(context).instagram();

                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
