import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/main_button.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/import_product_image.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/show_picker_dialog.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_update_space_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/back_appbar_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/product_category_button.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_button/menu_button.dart';

class AddNewMedicineContent extends StatelessWidget {
  const AddNewMedicineContent({
    Key? key,
  }) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _productNameController = TextEditingController();
  static final _productDetailsController = TextEditingController();
  static final _productPriceController = TextEditingController();
  static final _discountPercentController = TextEditingController();
  static final _quantityController = TextEditingController();
  static final _doseController = TextEditingController();

  static String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: myAppBarWithBack(
        context,
        actionsWidget: const SizedBox(),
        title: AppStrings.addProduct,
        actionsButton: () {},
      ),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
            children: [
              /*DropdownSearch<String>(
                onChanged: (value) {
                  // cubit.medId = cubit.itemsID[cubit.itemsName.indexOf(value.toString())];
                },
                showSearchBox: true,
                // items: cubit.itemsName,
                selectedItem: AppStrings.selectItem,
              ),
              SizedBox(height: mediaQueryHeight(context) / AppSize.s30),*/
              // Product forms.
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MainTextFormField(
                          controller: _productNameController,
                          label: AppStrings.productName,
                          inputType: TextInputType.text,
                          obscure: false,
                          validator: (value) {
                            if (value!.length < AppSize.s3) {
                              return AppStrings.enterValidProductName;
                            }
                            return null;
                          },
                        ),
                        const MedicineSpace(),
                        MainTextFormField(
                          controller: _productDetailsController,
                          inputType: TextInputType.multiline,
                          label: AppStrings.productDetails,
                          obscure: false,
                          maxLines: 3,
                          validator: (value) {
                            if (value!.length < AppSize.s3) {
                              return AppStrings.enterValidProductDetails;
                            } else {
                              return null;
                            }
                          },
                        ),
                        const MedicineSpace(),
                        MainTextFormField(
                          controller: _productPriceController,
                          label: AppStrings.productPrice,
                          inputType: TextInputType.phone,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty || value == '0') {
                              return AppStrings.enterValidPrice;
                            }
                            return null;
                          },
                        ),
                        const MedicineSpace(),
                        MainTextFormField(
                          controller: _discountPercentController,
                          label: AppStrings.productDiscountPercent,
                          inputType: TextInputType.phone,
                          obscure: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.enterValidDiscountPercent;
                            }
                            return null;
                          },
                        ),
                        const MedicineSpace(),
                        // Category & quantity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: MainTextFormField(
                                controller: _quantityController,
                                label: AppStrings.theQuantity,
                                inputType: TextInputType.phone,
                                obscure: false,
                                validator: (value) {
                                  if (value!.isEmpty || value == "0") {
                                    return AppStrings.enterValidQuantity;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: Text(
                                      AppStrings.productCategoryName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ),
                                  Flexible(
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return BlocBuilder<CategoriesBloc,
                                          CategoriesState>(
                                        builder: (context, state) {
                                          CacheHelper.setData(key: AppConstants.defaultCategory, value: state.categoriesName.first);
                                          switch (state.categoryRequestState) {
                                            case RequestState.loading:
                                              return const Center(
                                                child: CircularProgressIndicator(color: AppColors.primary),
                                              );
                                            case RequestState.loaded:
                                              return MenuButton<String>(
                                                items: state.categoriesName,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        AppSize.s10),
                                                  ),
                                                ),
                                                topDivider: true,
                                                itemBuilder: (String value) =>
                                                    Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal:
                                                          AppPadding.p10),
                                                  child: Text(value),
                                                ),
                                                toggledChild:
                                                    const ProductCategoryButton(),
                                                onItemSelected: (String value) {
                                                  setState(() {
                                                    selectedCategory =value;
                                                  });
                                                  debugPrint(selectedCategory);
                                                  context
                                                      .read<CategoriesBloc>()
                                                      .add(SelectCategoryEvent(
                                                          value));
                                                },
                                                child:
                                                    const ProductCategoryButton(),
                                              );
                                            case RequestState.error:
                                              return const SizedBox();
                                          }
                                        },
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const MedicineSpace(),
                        MainTextFormField(
                          controller: _doseController,
                          label: AppStrings.dose,
                          inputType: TextInputType.text,
                          obscure: false,
                          validator: (value) {
                            return null;
                          },
                        ),
                        const MedicineSpace(),
                        BlocBuilder<MedicineBloc, MedicineState>(
                          builder: (context, state) {
                            return ImportProductImage(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ShowPickerDialog(
                                      onCameraTapped: () {
                                        context.read<MedicineBloc>().pickImage(
                                              ImageSource.camera,
                                            );
                                        Navigator.of(context).pop();
                                      },
                                      onGalleryTapped: () {
                                        context.read<MedicineBloc>().pickImage(
                                              ImageSource.gallery,
                                            );
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<MedicineBloc, MedicineState>(
                builder: (context, state) {
                  switch (state.medicineButtonState) {
                    case ButtonState.loading:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    case ButtonState.static:
                      return MainButton(
                        title: AppStrings.addingProduct,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<MedicineBloc>().add(
                                  AddMedicineEvent(
                                    context: context,
                                    productName: _productNameController.text,
                                    productDescription: _productDetailsController.text,
                                    productPrice: double.parse(_productPriceController.text),
                                    discountPercent: double.parse(_discountPercentController.text),
                                    categoryName: selectedCategory,
                                    quantity: int.parse(_quantityController.text),
                                    dose: _doseController.text,
                                    createdAt: DateTime.now().toString(),
                                  ),
                                );
                          }
                        },
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
