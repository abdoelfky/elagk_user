import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/auth_title_subtitle_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/logo_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/main_button.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/login_pharmacy_controller/login_pharmacy_bloc.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/core/utils/text_field_validation.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/navigation.dart';

class LoginPharmacyScreen extends StatelessWidget {
  const LoginPharmacyScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
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
                        authTitle: AppStrings.login,
                        authSubtitle: AppStrings.pleaseLogin,
                      ),
                      MainTextFormField(
                        controller: _emailController,
                        label: AppStrings.userName,
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
                            navigateFinalTo(
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
                      BlocBuilder<LoginPharmacyBloc, LoginPharmacyState>(
                        builder: (context, state) {
                          switch (state.loginButtonState) {
                            case ButtonState.loading:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              );
                            case ButtonState.static:
                              return MainButton(
                                title: AppStrings.login,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      context.read<LoginPharmacyBloc>().add(
                                            LoginEvent(
                                              context: context,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                    } catch (error) {
                                      debugPrint(error.toString());
                                    }
                                  }
                                },
                              );
                          }
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                      Center(
                        child: BlocBuilder<AboutUsBloc, AboutUsState>(
                          builder: (context, state) {
                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.haveNotAccount,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  TextSpan(
                                    text: ' ${AppStrings.contactWithUs}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: AppColors.blue,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.read<AboutUsBloc>().add(
                                              const ContactUsViaCallEvent(),
                                            );
                                      },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
