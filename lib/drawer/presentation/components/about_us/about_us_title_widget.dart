import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AboutUsTitle extends StatelessWidget {
  const AboutUsTitle({
    Key? key,
    required this.imageSrc,
    required this.title,
  }) : super(key: key);

  final String imageSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Image.asset(
              imageSrc,
              height: AppSize.s22,
              width: AppSize.s22,
              fit: BoxFit.contain,
            ),
          ),
          const TextSpan(text: '  '),
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
