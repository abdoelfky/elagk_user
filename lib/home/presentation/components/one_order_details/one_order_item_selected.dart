import 'package:elagk/drawer/presentation/components/default_network_image_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class OneOrderItemSelected extends StatelessWidget {
  OneOrderItemSelected({
    Key? key,
    required this.imageSrc,
    required this.orderName,
    required this.orderItemQuantity,
    required this.orderItemPrice,
    this.elevation,
  }) : super(key: key);

  final String imageSrc;
  final String orderName;
  final String orderItemQuantity;
  final String orderItemPrice;
  double? elevation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p10),
      child: Card(
        elevation: elevation ?? AppSize.s0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            color: Colors.white,
          ),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: AppSize.s100,
                width: AppSize.s100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(AppSize.s10),
                      topRight: Radius.circular(AppSize.s10)),
                  child: DefaultNetworkImage(
                    imageSrc: imageSrc,
                    height: double.infinity,
                    width: double.infinity,
                    padding: AppSize.s10,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderName,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        "${AppStrings.quantity}$orderItemQuantity",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.darkGrey,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${AppStrings.piecePrice}$orderItemPrice",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: AppColors.darkGrey,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
