import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/controller/special_customers_controller/special_cutomers_cubit.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'special_customer_info.dart';

class SpecialCustomersContent extends StatelessWidget {
  const SpecialCustomersContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialCustomersCubit, SpecialCustomersState>(
      builder: (context, state) {
        return ScreenBackground(
            child: RefreshIndicator(
              onRefresh: () async
              {
                SpecialCustomersCubit.get(context).getSpecialCustomers();
              },
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(AppPadding.p15),
                      child: SpecialCustomersCubit.get(context)
                              .specialCustomers
                              .isNotEmpty
                          ? ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: SpecialCustomersCubit.get(context)
                                  .specialCustomers
                                  .length,
                              itemBuilder: (context, index) {
                                return SpecialCustomerInfo(
                                  context,
                                  (SpecialCustomersCubit.get(context)
                                      .specialCustomers[index]
                                      .firstName.toString()
                                      +' '+
                                      SpecialCustomersCubit.get(context)
                                      .specialCustomers[index]
                                      .lastName.toString()),
                                  SpecialCustomersCubit.get(context)
                                      .specialCustomers[index]
                                      .point,
                                  SpecialCustomersCubit.get(context)
                                      .specialCustomers[index]
                                      .totalPrice,
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) =>
                                  SizedBox(
                                height: 10,
                              ),
                            )
                          : (state is GetSpecialCustomersLoadingState)
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                )
                              : NoDataWidget(AppStrings.noTopUsers)),
                ],
              ),
            ));
      },
    );
  }
}
