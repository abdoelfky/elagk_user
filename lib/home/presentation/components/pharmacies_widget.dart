import 'package:elagk/home/presentation/components/pharmacy_item.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesWidget extends StatelessWidget {
  const PharmaciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit,HomeScreenState>(
      builder: (context, state) {
        return Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(AppStrings.pharmacies,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            SizedBox(
              height: mediaQueryHeight(context) * .025,
            ),

            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index)
                {
                  return PharmacyItem
                    (pharmacy:HomeScreenCubit.get(context)
                      .searchResult.isEmpty?
                  HomeScreenCubit.get(context).pharmacies[index]:
                  HomeScreenCubit.get(context).searchResult[index]
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20,),
                itemCount:HomeScreenCubit.get(context).searchResult.isEmpty?
                HomeScreenCubit.get(context).pharmacies.length:
                HomeScreenCubit.get(context).searchResult.length)
          ],);
      },
    );
  }
}
