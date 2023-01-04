import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({Key? key, required this.description}) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
