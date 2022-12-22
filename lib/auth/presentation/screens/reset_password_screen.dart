import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/auth_title_subtitle_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/logo_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/main_button.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/auth/presentation/controller/password_controller/password_bloc.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _passwordController = TextEditingController();

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
                        authTitle: AppStrings.newPassword,
                        authSubtitle: AppStrings.resetPasswordSubtitle,
                      ),
                      MainTextFormField(
                        controller: _passwordController,
                        label: AppStrings.theNewPassword,
                        hint: AppStrings.hintPassword,
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
                      BlocBuilder<PasswordBloc, PasswordState>(
                        builder: (BuildContext context, state) {
                          switch (state.resetPasswordButtonState) {
                            case ButtonState.loading:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              );
                            case ButtonState.static:
                              return MainButton(
                                title: AppStrings.resetPassword,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<PasswordBloc>().add(
                                          ResetPasswordEvent(
                                            context: context,
                                            password: _passwordController.text,
                                            email: "test@gmail.comm",
                                            // email: state.forgetPassword!.email,
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
            ),
          ),
        ),
      ),
    );
  }
}
