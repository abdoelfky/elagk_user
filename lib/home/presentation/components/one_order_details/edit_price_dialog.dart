import 'package:elagk/drawer/presentation/components/pharmacy_user_profile/edit_product_buttons.dart';
import 'package:elagk/home/presentation/components/one_order_details/edit_price_buttons.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import 'price_with_delivery_fields.dart';

class EditPriceDialog extends StatelessWidget {
  const EditPriceDialog({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _deliveryPriceController = TextEditingController();
  static final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s6),
        ),
        elevation: AppSize.s0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
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
                      const SizedBox(height: 5.0), // TODO.
                      const Text(
                        AppStrings.sendPrescriptionAndDeliverPrice,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: DeliveryPriceField(
                          deliveryPriceController: _deliveryPriceController,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: PriceField(
                          priceController: _priceController,
                        ),
                      ),
                      // cubit.isLoadingAuth ? const CircularProgressIndicator(color: AppColors.primary,) :
                      Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SendButton(
                                  deliveryPriceController:
                                      _deliveryPriceController,
                                  priceController: _priceController,
                                  // cubit: cubit,
                                ),
                                const CancelDialogButton(),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
