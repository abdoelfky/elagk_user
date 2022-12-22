import 'package:elagk/drawer/presentation/components/default_network_image_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class OneOrderItems extends StatelessWidget {
  const OneOrderItems({
    Key? key,
    required this.imageSrc,
    required this.index,
    required this.onPressed,
  }) : super(key: key);
  final String imageSrc;
  final int index;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        children: [
          Align(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: onPressed,
                child: SizedBox(
                  width: mediaQueryWidth(context) * AppSize.s0_5,
                  height: AppSize.s200,
                  child: DefaultNetworkImage(
                    imageSrc: imageSrc,
                    height: double.infinity,
                    width: double.infinity,
                    padding: AppPadding.p5,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
