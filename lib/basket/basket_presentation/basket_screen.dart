import 'package:elagk/basket/basket_presentation/basket_components/basket_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentation/components/screen_background.dart';
import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import 'basket_components/basket_widget.dart';


class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: BasketAppBar(
            context: context,
            title:AppStrings.basket,

          ),
          backgroundColor: AppColors.offWhite,
          body: ScreenBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children:  [
                  BasketSection(
                    firstCategoryName: "categoryName",
                  ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
