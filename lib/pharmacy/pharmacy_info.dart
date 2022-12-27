import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/global/app_colors.dart';
import '../shared/utils/app__fonts.dart';
import '../shared/utils/app_assets.dart';
import '../shared/utils/app_strings.dart';
import '../shared/utils/app_values.dart';

class PharmacyInformation extends StatelessWidget {
  const PharmacyInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s18,
        ),
      ),
      elevation: AppSize.s7,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        width: mediaQueryWidth(context) * AppSize.s0_8,
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          color: Colors.white,
        ),
        child: Flexible(
          child: Column(
            children: [
              Text(
                 "Pharmacy Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.mapPin),
                        SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
                        InkWell(
                          onTap: () {

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
                    ),
                    Padding(
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
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}
