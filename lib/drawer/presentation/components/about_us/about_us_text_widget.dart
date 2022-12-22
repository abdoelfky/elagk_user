import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({Key? key, required this.description}) : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
