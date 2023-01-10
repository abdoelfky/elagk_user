import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/auth_title_subtitle_widget.dart';
import 'package:elagk/auth/presentation/components/logo_widget.dart';
import 'package:elagk/auth/presentation/components/main_button.dart';
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/auth/presentation/controller/login_controller/login_cubit.dart';
import 'package:elagk/auth/presentation/controller/login_controller/login_states.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:elagk/shared/utils/text_field_validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final _formKey = new GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ScreenBackground(
          textDirection: TextDirection.rtl,

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
                      authTitle: AppStrings.login,
                      authSubtitle: AppStrings.pleaseLogin,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          navigateTo(
                            context: context,
                            screenRoute: Routes.forgetPasswordScreen,
                          );
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(
                                color: AppColors.yellowBold,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) / AppSize.s80,
                    ),
                    BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {

                          if (state.loginModel.roles![0]
                                  .toString()
                                  .toUpperCase() ==
                              'USER') {
                            showToast(
                                text: 'Login Successfully',
                                state: ToastStates.SUCCESS);
                            navigateFinalTo(
                                context: context,
                                screenRoute: Routes.homeDrawer);
                          }else
                          {
                            showToast(
                                text: 'This User Can\'t Access' ,
                                state: ToastStates.ERROR);
                          }
                        } else if (state is LoginErrorState) {
                          showToast(
                              text: '${state.error}',
                              state: ToastStates.ERROR);
                        }
                      },
                      builder: (context, state) {
                        return ConditionalBuilder(condition:(state is LoginLoadingState),
                            builder: (context)=>const CircularProgressIndicator(),
                            fallback: (context)=>MainButton(
                              title: AppStrings.login,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text);
                                }
                              },
                            )
                        );
                      },
                    ),
                    SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                    Center(
                        child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.haveNotAccount,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          TextSpan(
                            text: ' ${AppStrings.createAccount}',
                            style: TextStyle(
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                navigateTo(
                                    context: context,
                                    screenRoute: Routes.registerScreen);
                              },
                          ),
                        ],
                      ),
                    )),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



