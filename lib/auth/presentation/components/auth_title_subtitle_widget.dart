import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class AuthTitleAndSubtitle extends StatelessWidget {
  const AuthTitleAndSubtitle(
      {Key? key, required this.authTitle, required this.authSubtitle})
      : super(key: key);

  final String authTitle;
  final String authSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaQueryHeight(context) / AppSize.s100,
        ),
        Text(
          authTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
        Text(
          authSubtitle,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: mediaQueryHeight(context) / AppSize.s20),
      ],
    );
  }
}
