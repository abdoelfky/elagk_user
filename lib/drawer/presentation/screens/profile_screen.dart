import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/main_button.dart';
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/home/presentation/components/body_welcome.dart';
import 'package:elagk/home/presentation/components/offers_slider_widget.dart';
import 'package:elagk/home/presentation/components/pharmacies_widget.dart';
import 'package:elagk/home/presentation/components/search_widget.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:elagk/shared/utils/text_field_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _phoneController = TextEditingController();
  static final _nameController = TextEditingController();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // TODO: remove Scaffold qnd appBar.
          appBar: fixedAppBar(
            context: context,
            title: AppStrings.profile,
            actionWidget: const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: mediaQueryHeight(context) * .025,
                    ),
                    //phone number
                    MainTextFormField(
                      controller: _phoneController,
                      label: AppStrings.phoneNumber,
                      hint: AppStrings.phoneExample,
                      hintColor: AppColors.lightGrey,
                      inputType: TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      obscure: false,
                      validator: (value) {
                        if (value!.length < 11) {
                          return AppStrings.enterValidnum;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .025,
                    ),
                    //userName
                    MainTextFormField(
                      controller: _nameController,
                      label: AppStrings.userName,
                      hint: AppStrings.userName,
                      hintColor: AppColors.lightGrey,
                      inputType: TextInputType.name,
                      textDirection: TextDirection.rtl,
                      obscure: false,
                      validator: (value) {
                        if (value!.length < 3) {
                          return AppStrings.enterValidFullName;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .025,
                    ),
                    //email
                    MainTextFormField(
                      controller: _emailController,
                      label: AppStrings.email,
                      hint: AppStrings.emailExample,
                      hintColor: AppColors.lightGrey,
                      inputType: TextInputType.emailAddress,
                      textDirection: TextDirection.ltr,
                      obscure: false,
                      validator: (value) => validateEmail(value!),
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .025,
                    ),
                    MainTextFormField(
                      controller: _passwordController,
                      label: AppStrings.password,
                      hint: AppStrings.passwordExample,
                      hintColor: AppColors.lightGrey,
                      inputType: TextInputType.visiblePassword,
                      textDirection: TextDirection.ltr,
                      obscure: true,
                      validator: (value) {
                        if (value!.length < AppSize.s8) {
                          return AppStrings.enterValidPassword;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .34,
                    ),
                    BlocConsumer<ProfileCubit, ProfileStates>(
                      listener: (context, state) {
                        if(state is ProfileUpdateUserDataSuccessState)
                        {
                          showToast(
                                    text: 'Data Updated Successfully',
                                    state: ToastStates.SUCCESS);
                        }
                        else if(state is ProfileUpdateUserDataErrorState)
                        {
                          showToast(
                              text: 'Enter valid Data',
                              state: ToastStates.ERROR);

                        }


                        if (state is ProfileGetUserDataSuccessState) {

                          // _phoneController.text =
                          //     ProfileCubit.get(context).userModel!.phoneNumber!;
                          _nameController.text =
                              ProfileCubit.get(context).userModel!.userName!;
                          _emailController.text =
                              ProfileCubit.get(context).userModel!.email!;
                          _passwordController.text ='***********';
                        }
                      },
                      builder: (context, state) {
                        return ConditionalBuilder(
                            condition:
                                (state is ProfileUpdateUserDataLoadingState),
                            builder: (context) =>
                                const CircularProgressIndicator(),
                            fallback: (context) => MainButton(
                                  title: AppStrings.saveChanges,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate())
                                    {
                                      ProfileCubit.get(context).updateUserProfileData
                                        (email: _emailController.text.trim(),
                                          userName: _nameController.text,
                                          phone: _phoneController.text,
                                          password: _passwordController.text);

                                    }
                                  },
                                ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // HomeScreen
      ),
    );
  }
}
