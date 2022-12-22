import 'package:elagk/drawer/presentation/components/default_network_image_widget.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlideShow extends StatelessWidget {
  const ImageSlideShow({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                body: ImageSlideshow(
                  width: double.infinity,
                  height: double.infinity,
                  initialPage: 0,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {},
                  isLoop: false,
                  children: [
                    DefaultNetworkImage(height: double.infinity,width: double.infinity,imageSrc: image, padding: AppPadding.p5)
                  ],
                ),
              ),
            ),
    );
  }
}


Widget getImageWidget(String image) {
  return Center(
    child: InteractiveViewer(
      minScale: 0.1,
      maxScale: 2.0,
      child: Container(
        margin: const EdgeInsets.only(left: 1.0, right: 1.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}