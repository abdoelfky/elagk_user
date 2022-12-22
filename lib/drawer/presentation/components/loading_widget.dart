
import 'package:flutter/material.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_values.dart';
import 'drawer_widgets/menu_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key,required this.showDrawer}) : super(key: key);

  final bool showDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: AppSize.s0,
        automaticallyImplyLeading: true,
        leading: showDrawer ? const MenuWidget() : const SizedBox(),
      ),
      body: const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
