import 'package:elagk_pharmacy/core/utils/app__fonts.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/default_network_image_widget.dart';
import 'package:flutter/material.dart';

class HeaderDrawerSection extends StatelessWidget {
  const HeaderDrawerSection({
    Key? key,
    required this.title,
    required this.imageSrc,
  }) : super(key: key);
  final String title;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p10,
        vertical: AppPadding.p24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s48),
            child: DefaultNetworkImage(
              imageSrc: imageSrc,
              height: AppSize.s48,
              width: AppSize.s48,
              padding: AppPadding.p0,
            ),
          ),
          SizedBox(width: mediaQueryWidth(context) / AppSize.s50),
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: FontSize.s20,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
