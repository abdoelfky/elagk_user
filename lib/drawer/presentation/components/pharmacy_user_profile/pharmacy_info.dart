import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyInformation extends StatelessWidget {
  const PharmacyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
      ),
      elevation: AppSize.s5,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        width: mediaQueryWidth(context) * AppSize.s0_9,
        height: AppSize.s60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: Colors.white,
        ),
        child: BlocBuilder<PharmacyProfileBloc, PharmacyProfileState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  state.pharmacyUser!.pharmacyName ?? "Pharmacy Name",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageAssets.mapPin),
                    SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
                    InkWell(
                      onTap: () {
                        sl<AboutUsBloc>()
                          .add(ContactUsViaLocationEvent(
                            latitude: state.pharmacyUser!.latitude.toString(),
                            longitude: state.pharmacyUser!.longitude.toString(),
                          ));
                      },
                      child: Text(
                        "العنوان",
                        // TODO: text button to maps.
                        // cubit.onePharmacyModel!.data!.location.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.darkGrey,
                            ),
                      ),
                    ),
                  ],
                ),*/
                /*Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                  child: Row(
                    children: [
                      Image.asset(ImageAssets.between),
                      SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
                      Text(
                        "Test", // TODO.
                        // "${AppStrings.area}\n${cubit.onePharmacyModel!.data!.area!.name.toString()}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeightManager.medium,
                            ),
                      ),
                      const Spacer(),
                      Image.asset(ImageAssets.order),
                      SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
                      Text(
                        AppStrings.deliveryOrderIn30Minutes,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeightManager.medium,
                            ),
                      ),
                    ],
                  ),
                ),*/
              ],
            );
          },
        ),
      ),
    );
  }
}
