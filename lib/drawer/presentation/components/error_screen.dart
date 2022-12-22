
import 'package:flutter/material.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_strings.dart';

// TODO: handle screen UI.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.red,
      child: const Text(AppStrings.undefined),
    );
  }
}
