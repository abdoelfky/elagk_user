import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/main_button.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/services/services_locator.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/import_product_image.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/show_picker_dialog.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/add_update_space_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/delete_medicine_dialog.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/product_category_button.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_button/menu_button.dart';

class UpdateMedicineContent extends StatefulWidget {
  const UpdateMedicineContent({
    Key? key,
    required this.productId,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.discountPercent,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    required this.dose,
  }) : super(key: key);

  final int productId;
  final String productName;
  final String description;
  final String imageUrl;
  final double price;
  final double discountPercent;
  final int categoryId;
  final String categoryName;
  final int quantity;
  final String dose;

  @override
  State<UpdateMedicineContent> createState() => _UpdateMedicineContentState();
}

class _UpdateMedicineContentState extends State<UpdateMedicineContent> {
  static final _formKey = GlobalKey<FormState>();

  static String? selectedCategory;

  static TextEditingController? _productNameController;
  static TextEditingController? _productDetailsController;
  static TextEditingController? _productPriceController;
  static TextEditingController? _discountPercentController;
  static TextEditingController? _quantityController;
  static TextEditingController? _doseController;

  @override
  void initState() {
    _productNameController = TextEditingController(text: widget.productName);
    _productDetailsController = TextEditingController(text: widget.description);
    _productPriceController =
        TextEditingController(text: widget.price.toString());
    _discountPercentController =
        TextEditingController(text: widget.discountPercent.toString());
    _quantityController =
        TextEditingController(text: widget.quantity.toString());
    _doseController = TextEditingController(text: widget.dose);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: BlocBuilder<MedicineBloc, MedicineState>(
          builder: (context, state) {
            return Column(
              children: [
                // Product forms.
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MainTextFormField(
                            controller: _productNameController!,
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
                            controller: _productDetailsController!,
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
                            controller: _productPriceController!,
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
                            controller: _discountPercentController!,
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
                                  controller: _quantityController!,
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
                                      child: BlocBuilder<CategoriesBloc,
                                          CategoriesState>(
                                        builder: (context, state) {
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
                                                  context
                                                      .read<CategoriesBloc>()
                                                      .add(SelectCategoryEvent(
                                                          value));
                                                  setState(() {
                                                    selectedCategory = value;
                                                  });
                                                },
                                                child:
                                                    const ProductCategoryButton(),
                                              );
                                            case RequestState.error:
                                              return const SizedBox();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const MedicineSpace(),
                          MainTextFormField(
                            controller: _doseController!,
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
                                          context.read<MedicineBloc>().pickImage(ImageSource.camera);
                                          Navigator.of(context).pop();
                                        },
                                        onGalleryTapped: () {
                                          context
                                              .read<MedicineBloc>()
                                              .pickImage(ImageSource.gallery);
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
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: AppSize.si5,
                              child: MainButton(
                                title: AppStrings.editingProduct,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<MedicineBloc>().add(
                                          UpdateMedicineEvent(
                                            context: context,
                                            productId: widget.productId,
                                            productName: _productNameController!.text,
                                            productDescription: _productDetailsController!.text,
                                            productPrice: double.parse(_productPriceController!.text),
                                            discountPercent: double.parse(_discountPercentController!.text),
                                            categoryName: selectedCategory ?? widget.categoryName,
                                            quantity: int.parse(_quantityController!.text),
                                            dose: _doseController!.text,
                                            imageUrl: widget.imageUrl,
                                          ),
                                        );
                                  }
                                },
                              ),
                            ),
                            Flexible(
                              child: IconButton(
                                onPressed: () {
                                  showWarningDialog(
                                      context: context,
                                      onDeletePressed: () {
                                        context.read<MedicineBloc>().add(
                                              DeleteMedicineEvent(
                                                context: context,
                                                id: widget.productId,
                                              ),
                                            );
                                      });
                                },
                                icon: SvgPicture.asset(
                                  ImageAssets.deleteIcon,
                                  fit: BoxFit.contain,
                                  height: AppSize.s40,
                                  width: AppSize.s40,
                                ),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
