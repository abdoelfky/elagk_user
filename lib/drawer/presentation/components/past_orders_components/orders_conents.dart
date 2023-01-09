import 'package:elagk/drawer/presentation/components/past_orders_components/my_devider_component.dart';
import 'package:elagk/drawer/presentation/components/past_orders_components/order_item_content.dart';
import 'package:elagk/drawer/presentation/controller/past_orders_controller/past_orders_cubit.dart';
import 'package:elagk/drawer/presentation/controller/past_orders_controller/past_orders_state.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersContents extends StatelessWidget {
  const OrdersContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PastOrdersCubit, PastOrdersStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is GetPastOrdersSuccessState &&
            PastOrdersCubit.get(context).pastOrders.isNotEmpty ) {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: RefreshIndicator(
                  onRefresh: ()async
                  {
                    PastOrdersCubit.get(context).getPastOrders();
                  },
                  child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          OrderItem(
                          context: context,
                          pastOrder: PastOrdersCubit.get(context).pastOrders[index],
                          isActive: PastOrdersCubit.get(context).pastOrders[index]
                              .status!),
                      separatorBuilder: (context, index) => MyDivider(),
                      itemCount: PastOrdersCubit.get(context).pastOrders.length),
                ),
              ),
            ],
          );
        }
        else if(state is GetPastOrdersSuccessState &&
            PastOrdersCubit.get(context).pastOrders.isEmpty)
        {
          return Center(child: NoDataWidget(AppStrings.noPastOrders));
        }

        else
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
      },
    );
  }
}
