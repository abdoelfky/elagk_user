

import 'package:elagk/shared/utils/app_strings.dart';

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(
    pattern,
    caseSensitive: false,
    multiLine: false,
  );
  if (value!.isEmpty || !regex.hasMatch(value)) {
    return AppStrings.enterValidEmail;
  } else {
    return null;
  }
}
