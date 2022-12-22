import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryButton extends StatelessWidget {
  const ProductCategoryButton({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s90,
      height: AppSize.s40,
      child: Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p16, right: AppPadding.p12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                return Text(
                  state.selectedCategory ?? state.category!.first.categoryName,
                  overflow: TextOverflow.ellipsis,
                );
              },
            )),
            const SizedBox(
              width: AppSize.s12,
              height: AppSize.s18,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
