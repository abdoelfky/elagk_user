import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../../../../shared/components/toast_component.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_routes.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import '../../../../shared/utils/navigation.dart';
import '../../../../shared/utils/text_field_validation.dart';
import '../../components/MainTextFormField.dart';
import '../../components/auth_title_subtitle_widget.dart';
import '../../components/logo_widget.dart';
import '../../components/main_button.dart';
import '../../components/screen_background.dart';
import '../../controller/forget_passord_controller/forget_passowrd_state.dart';
import '../../controller/reset_password_controller/reset_password_cubit.dart';
import '../../controller/reset_password_controller/reset_password_state.dart';
import '../forget_password/forget_password_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = new GlobalKey<FormState>();
  static final _passwordController = TextEditingController();
  static final _emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: ScreenBackground(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      const AuthTitleAndSubtitle(
                        authTitle: AppStrings.forgotPassword,
                        authSubtitle: AppStrings.pleasePass,
                      ),
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
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
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
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),

                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      FlutterPwValidator(
                        successColor: AppColors.primary,

                        controller: _passwordController,
                        minLength: 8,
                        uppercaseCharCount: 1,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        normalCharCount: 1,
                        width: 400,
                        height: 150,
                        onSuccess: (){

                          return 'Success';
                        },
                        onFail: (){
                          return 'Password is Weak';
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
                        listener: (context, state) {
                          if (state is ResetPassSuccessState) {
                            {
                              showToast(
                                  text: AppStrings.resetPassword, state: ToastStates.SUCCESS);
                              navigateFinalTo(
                                  context: context,
                                  screenRoute: Routes.homeDrawer);
                            }

                          } else if (state is ResetPassErrorState) {
                            showToast(
                                text: AppStrings.erorrResetPassword,
                                state: ToastStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! ResetPassLoadingState,
                            builder: (context) => MainButton(
                              title: AppStrings.codeSendButton,
                              onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    ResetPasswordCubit.get(context)
                                        .ResetPass(
                                        password: _passwordController.toString(),
                                      email: _emailController.toString()
                                    );
                                  }
                              },
                            ),
                            fallback: (context) =>
                            const CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

