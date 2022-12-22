import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import '../../../shared/utils/enums.dart';
import '../components/logo_widget.dart';
import '../components/main_button.dart';
import '../components/screen_background.dart';
import '../controller/password_controller/password_bloc.dart';

class OTPVerifyScreen extends StatelessWidget {
  const OTPVerifyScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ScreenBackground(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  RichText(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      TextSpan(
                        text: AppStrings.emailVerification,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: "\n${AppStrings.verificationCodeSent} ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      TextSpan(
                        text: email,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.blue,
                            ),
                      ),
                    ]),
                  ),
                  BlocBuilder<PasswordBloc, PasswordState>(
                    builder: (context, state) {
                      return OtpTextField(
                        numberOfFields: AppSize.si6,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        borderColor: AppColors.blue,
                        focusedBorderColor: AppColors.blue,
                        keyboardType: TextInputType.phone,
                        margin:
                            const EdgeInsets.symmetric(vertical: AppMargin.m22),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        cursorColor: AppColors.blue,
                        // set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  color: AppColors.blue,
                                ),
                        //runs when a code is typed in
                        // onCodeChanged: (String code) {
                        // handle validation or checks here
                        // },
                        // runs when every textField is filled
                        onSubmit: (String verificationCode) {
                          context.read<PasswordBloc>().submitPinCode(
                                int.parse(verificationCode),
                              );
                        }, // end onSubmit
                      );
                    },
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s38),
                  BlocBuilder<PasswordBloc, PasswordState>(
                    builder: (context, state) {
                      switch (state.emailActivationButtonState) {
                        case ButtonState.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          );
                        case ButtonState.static:
                          return MainButton(
                              title: AppStrings.verify,
                              onPressed: () {
                                if (context
                                        .read<PasswordBloc>()
                                        .pinCode
                                        .toString()
                                        .length ==
                                    6) {
                                  context.read<PasswordBloc>().add(
                                        ActivationEmailEvent(
                                          context: context,
                                          code: context
                                              .read<PasswordBloc>()
                                              .pinCode!,
                                        ),
                                      );
                                }
                              });
                      }return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
