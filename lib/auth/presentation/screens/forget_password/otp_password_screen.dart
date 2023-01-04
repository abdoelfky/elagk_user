import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/controller/forget_passord_controller/forget_password_cubit.dart';
import 'package:elagk/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../../shared/components/toast_component.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_routes.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import '../../../../shared/utils/navigation.dart';
import '../../components/auth_title_subtitle_widget.dart';
import '../../components/logo_widget.dart';
import '../../components/screen_background.dart';
import '../../controller/otp_password/otp_password_cubit.dart';
import '../../controller/otp_password/otp_password_state.dart';
import 'otp_componant/otp_componants.dart';

class OtpPasswordScreen extends StatelessWidget {
  static final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey ,
            child: BlocConsumer<OtpPasswordCubit, OtpPasswordStates>(
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  showToast(
                      text: AppStrings.codeSendedSuccessFully1,
                      state: ToastStates.SUCCESS);
                  navigateFinalTo(
                      context: context,
                      screenRoute: Routes.confirmPasswordScreen);
                } else if (state is OtpErrorState) {
                  showToast(
                      text: AppStrings.codeSendError1, state: ToastStates.ERROR);
                }
              },
              builder: (context, state) {
                Duration duration = OtpPasswordCubit.get(context).duration;

                if (duration == Duration(seconds: 0)&&state is OtpPasswordInitialState) {
                  OtpPasswordCubit.get(context).otpCounter();
                }
                return ScreenBackground(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(AppPadding.p15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LogoWidget(),
                          const AuthTitleAndSubtitle(
                            authTitle: AppStrings.codeSendButton,
                            authSubtitle: AppStrings.enterValidnum,
                          ),

                          SizedBox(
                              height: mediaQueryHeight(context) / AppSize.s30),
                          ConditionalBuilder(
                            condition: state is! OtpLoadingState,
                            builder: (context) => VerificationCode(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                              keyboardType: TextInputType.number,
                              underlineColor: AppColors.offBlue,
                              length: 6,
                              cursorColor: Colors.blue,
                              onCompleted: (String value) {
                                if (_formKey.currentState!.validate()) {
                                  OtpPasswordCubit.get(context).Otp(
                                    code: int.parse(value),
                                  );
                                }
                              },
                              onEditing: (bool value) {},
                              margin: const EdgeInsets.all(12),
                            ),
                            fallback: (context) =>
                                const CircularProgressIndicator(),
                          ),
                          SizedBox(
                              height: mediaQueryHeight(context) / AppSize.s30),
                          buildTime(
                            duration,
                          ),
                          SizedBox(
                              height: mediaQueryHeight(context) / AppSize.s50),

                          TextButton(
                            onPressed: () {
                              if (duration == Duration(seconds: 0)) {
                                OtpPasswordCubit.get(context).otpCounter();
                                ForgetPasswordCubit.get(context).sendOTP(
                                    email: ForgetPasswordScreen
                                        .emailController.text
                                        .trim());
                              }
                            },
                            child: Text(
                              AppStrings.sendCodeAgain,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: AppColors.yellowBold,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                                  ),
                            ),
                          ),
                          // MainButton(
                          //   title: AppStrings.codeSendButton,
                          //   onPressed: (value) async {
                          //     if (_formKey.currentState!.validate()) {
                          //       OtpPasswordCubit.get(context)
                          //           .Otp(code:int.parse(value) ,);
                          //     }
                          //
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
