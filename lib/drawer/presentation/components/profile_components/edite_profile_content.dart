import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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

class EditProfileContent extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  bool _hasInternet = false;
  static final _phoneController = TextEditingController();
  static final _userNameController = TextEditingController();
  static final _firstNameController = TextEditingController();
  static final _lastNameController = TextEditingController();
  static final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
      if (state is ProfileUpdateUserDataSuccessState) {
        showToast(
            text: 'Data Updated Successfully', state: ToastStates.SUCCESS);
      } else if (state is ProfileUpdateUserDataErrorState) {
        showToast(text: 'Enter valid Data', state: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      if (state is! ProfileUpdateUserDataSuccessState) {
        _phoneController.text =
            ProfileCubit.get(context).userModel!.userPhones![0];
        _userNameController.text =
            ProfileCubit.get(context).userModel!.userName!;
        _firstNameController.text =
            ProfileCubit.get(context).userModel!.firstName!;
        _lastNameController.text =
            ProfileCubit.get(context).userModel!.lastName!;
        _emailController.text = ProfileCubit.get(context).userModel!.email!;
      }
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
                                    '${profileCubit.userModel!.profilePicturePath
                                        .toString()}'    )
                                : AssetImage(
                                    'assets/images/menu/user.png',
                                  ) as ImageProvider,
                      ),
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundColor: AppColors.primary,
                      child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 4), () {

                                    Navigator.of(context).pop(true);
                                  });
                                  return AlertDialog(
                                    elevation: 50.0,
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text(
                                          'Gallary',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        onPressed: () {
                                          ProfileCubit.get(context)
                                              .getProfileImageGallery();
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: const Text('Camera',
                                            style: TextStyle(
                                                color: AppColors.primary)),
                                        onPressed: () {
                                          ProfileCubit.get(context)
                                              .getProfileImageCamera();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }),
                    )
                  ],
                ),

                SizedBox(
                  height: mediaQueryHeight(context) * .025,
                ),
                MainTextFormField(
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
                MainTextFormField(
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
                //userName
                MainTextFormField(
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
                  height: mediaQueryHeight(context) * .02,
                ),
                ConditionalBuilder(
                    condition: (state is ProfileUpdateUserDataLoadingState),
                    builder: (context) => const CircularProgressIndicator(),
                    fallback: (context) => MainButton(
                          title: AppStrings.saveChanges,
                          onPressed: () async {
                            _hasInternet =
                                await InternetConnectionChecker().hasConnection;
                            if (_hasInternet) {
                              if (_formKey.currentState!.validate()) {
                                ProfileCubit.get(context).updateUserProfileData(
                                    email: _emailController.text.trim(),
                                    phones: _phoneController.text,
                                    userName: _userNameController.text,
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                );
                              }
                            }
                          },
                        )),
                SizedBox(
                  height: mediaQueryHeight(context) * .01,
                ),
                MainButton(
                  title: AppStrings.changePassword,
                  onPressed: () async {
                    _hasInternet =
                    await InternetConnectionChecker().hasConnection;
                    if (_hasInternet) {
                      navigateTo(context: context, screenRoute:
                      Routes.resetPasswordScreenByOldPassword
                      );
                    }
                  },
                ),
                SizedBox(
                  height: mediaQueryHeight(context) * .03,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
