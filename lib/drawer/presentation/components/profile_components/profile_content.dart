import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/main_button.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/text_field_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'profile_text_form_feild.dart';
class ProfileContent extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  bool _hasInternet = false;
  static final _phoneController = TextEditingController();
  static final _nameController = TextEditingController();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state) {


        },
        builder: (context,state)
    {
      _phoneController.text =
      ProfileCubit.get(context).userModel!.userPhones![0];
      _nameController.text =
      ProfileCubit.get(context).userModel!.userName!;
      _emailController.text =
      ProfileCubit.get(context).userModel!.email!;
      _passwordController.text ='***********';
      return Padding(
        padding: const EdgeInsets.all(AppPadding.p15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: mediaQueryHeight(context) * .025,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 4,
                        color: AppColors.lightGrey,
                      )),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                        'assets/images/menu/profile.png',
                      ),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(
                  height: mediaQueryHeight(context) * .025,
                ),
                //phone number
                ProfileTextFormField(
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
                ProfileTextFormField(
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
                ProfileTextFormField(
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
                ProfileTextFormField(
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
                  height: mediaQueryHeight(context) * .14,
                ),
                MainButton(
                  title: AppStrings.editProfile,
                  onPressed: ()  {
                   navigateTo(context: context, screenRoute: Routes.editProfileScreen);
                  },
                ),


              ],
            ),
          ),
        ),
      );
    });
  }
}
