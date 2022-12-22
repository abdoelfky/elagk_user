import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.onTap,
    required this.orderNumber,
    required this.orderDate,
    required this.statusType,
    required this.status,
  }) : super(key: key);
  final GestureTapCallback onTap;
  final String orderNumber;
  final String orderDate;
  final String statusType;
  final int status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s5),
            color: Colors.grey[AppSize.si200]),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
                width: AppSize.s50,
                height: AppSize.s50,
                child: ClipOval(child: Image.asset(ImageAssets.customer))),
          ),
          title: Padding(
            padding: const EdgeInsets.all(AppPadding.p2),
            child: Text(
              "${AppStrings.orderNumber}$orderNumber",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          subtitle: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s50),
              color: status == 1
                  ? Colors.grey
                  : status == 4
                      ? Colors.red
                      : Colors.green,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p5),
                child: Text(
                    status == 1
                        ? AppStrings.newOrder
                        : status == 4
                            ? AppStrings.refuseOrAnnoy
                            : statusType,
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
            ),
          ),
          trailing: Text(
            orderDate,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
