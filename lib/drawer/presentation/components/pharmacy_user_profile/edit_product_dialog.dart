import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/pharmacy_user_profile/edit_product_buttons.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/pharmacy_user_profile/edit_product_fields.dart';
import 'package:flutter/material.dart';

/*class EditProductDialog extends StatelessWidget {
  const EditProductDialog({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _newAmountController = TextEditingController();
  static final _newPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s6)),
        elevation: AppSize.s0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s6),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: AppSize.s10,
                offset: Offset(AppSize.s0, AppSize.s10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Test', // TODO.
                    // "${AppStrings.editProduct}${cubit.onePharmacyModel!.data!.activeMedicines![index].name}",
                    textDirection: TextDirection.rtl,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: ContentTitleField(
                      newAmountController: _newAmountController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p20),
                    child: ContentPriceField(
                      newPriceController: _newPriceController,
                    ),
                  ),
                  false
                  // cubit.isLoadingAuth // TODO.
                      ? const Padding(
                    padding: EdgeInsets.all(AppPadding.p8),
                    child: CircularProgressIndicator(color: AppColors.primary),
                  )
                      : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EditProductButton(
                        formKey: _formKey,
                        newAmountController: _newAmountController,
                        newPriceController: _newPriceController,
                      ),
                      const CancelDialogButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}*/
