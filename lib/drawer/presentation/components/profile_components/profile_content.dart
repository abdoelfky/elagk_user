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
  static final _phoneController = TextEditingController();
  static final _userNameController = TextEditingController();
  static final _firstNameController = TextEditingController();
  static final _lastNameController = TextEditingController();
  static final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state) {


        },
        builder: (context,state)
    {
      _phoneController.text =
      ProfileCubit.get(context).userModel!.userPhones![0];
      _userNameController.text =
      ProfileCubit.get(context).userModel!.userName!;
      _emailController.text =
      ProfileCubit.get(context).userModel!.email!;
      _firstNameController.text =
      ProfileCubit.get(context).userModel!.firstName!;
      _lastNameController.text =
      ProfileCubit.get(context).userModel!.lastName!;
      var profileCubit = ProfileCubit.get(context);

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
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 88,
                      backgroundColor: AppColors.primary,
                      child: CircleAvatar(
                        radius: 85.0,
                        backgroundImage: profileCubit.profileImage != null
                            ? FileImage(profileCubit.profileImage!)
                            : profileCubit.userModel!.profilePicturePath != null
                            ? NetworkImage(
                            '${profileCubit.userModel!.profilePicturePath.toString()}')
                            : AssetImage(
                          'assets/images/menu/user.png',
                        ) as ImageProvider,
                      ),
                    ),
                  ],
                ),


                SizedBox(
                  height: mediaQueryHeight(context) * .025,
                ),
                //userName
                ProfileTextFormField(
                  controller: _firstNameController,
                  label: AppStrings.firstName,
                  hint: AppStrings.firstName,
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
                ProfileTextFormField(
                  controller: _lastNameController,
                  label: AppStrings.lastName,
                  hint: AppStrings.lastName,
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
                ProfileTextFormField(
                  controller: _userNameController,
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
