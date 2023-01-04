import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
import '../../controller/forget_passord_controller/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = new GlobalKey<FormState>();
  static final emailController = TextEditingController();

  static const countdownDuration = Duration(minutes: 3);

  @override
  Widget build(BuildContext context) {
    bool _hasInternet = false;
    final color = _hasInternet ? Colors.green : Colors.red;
    final text = _hasInternet ? 'Internet' : 'No Internet';
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
                        authSubtitle: AppStrings.enterValidEmail,
                      ),
                      MainTextFormField(
                        controller: emailController,
                        label: AppStrings.enterValidEmail,
                        hint: AppStrings.emailExample,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) => validateEmail(value!),
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),

                      BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                        listener: (context, state) {
                          if (state is SendOTPSuccessState) {
                            {
                              showToast(
                                  text: AppStrings.codeSendedSuccessFully, state: ToastStates.SUCCESS);
                              navigateTo(
                                  context: context,
                                  screenRoute: Routes.otpPasswordScreen);
                            }

                          } else if (state is SendOTPErrorState) {
                            showToast(
                                text: AppStrings.codeSendError,
                                state: ToastStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! SendOTPLoadingState,
                            builder: (context) => MainButton(
                              title: AppStrings.codeSendButton1,
                              onPressed: () async {

                                _hasInternet = await InternetConnectionChecker()
                                    .hasConnection;
                                if (_hasInternet) {
                                  if (_formKey.currentState!.validate()) {
                                    ForgetPasswordCubit.get(context)
                                        .sendOTP(email: emailController.text.trim());

                                  }
                                }
                                else {
                                  showToast(
                                      text:
                                          'Please Check Your Network Connection',
                                      state: ToastStates.ERROR);
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

