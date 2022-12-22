import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer/presentation/controller/about_us_controller/about_us_bloc.dart';
import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import '../../../shared/utils/enums.dart';
import '../../../shared/utils/navigation.dart';
import '../../../shared/utils/text_field_validation.dart';
import '../components/MainTextFormField.dart';
import '../components/auth_title_subtitle_widget.dart';
import '../components/logo_widget.dart';
import '../components/main_button.dart';
import '../components/screen_background.dart';
import '../controller/login_pharmacy_controller/login_pharmacy_bloc.dart';

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
