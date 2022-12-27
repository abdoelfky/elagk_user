import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_values.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    Key? key,
    required this.imageSrc,
    required this.height,
    required this.width,
    required this.padding,
  }) : super(key: key);

  final String imageSrc;
  final double height;
  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s5),
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, s, p) => const Padding(
              padding: EdgeInsets.all(AppPadding.p18),
            ),
            errorWidget: (context, string, dynamic) => Padding(
              padding: EdgeInsets.all(padding),
              child: Image.asset(ImageAssets.errorImage),
            ),
            imageUrl: imageSrc,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
