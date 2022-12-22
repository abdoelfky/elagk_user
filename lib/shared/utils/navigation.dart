import 'package:flutter/material.dart';

void navigateTo({required BuildContext context,required String screenRoute, Object? arguments}) =>
    Navigator.pushNamed(context, screenRoute, arguments: arguments);

void navigateFinalTo({required BuildContext context,required String screenRoute, Object? arguments}) =>
    Navigator.pushReplacementNamed(context, screenRoute, arguments: arguments);
