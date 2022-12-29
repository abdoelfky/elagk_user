import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
import '../../components/main_button.dart';
import '../../components/screen_background.dart';
import '../../controller/confim_password/confirm_password_cubit.dart';
import '../../controller/confim_password/confirm_password_state.dart';


class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final emailController = TextEditingController();

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
                        authTitle: AppStrings.codeSendButton,
                        authSubtitle: AppStrings.enterValidnum,
                      ),


                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      BlocConsumer<ConfirmPasswordCubit, ConfirmPasswordStates>(
                        listener: (context, state) {
                          if (state is SendCodeSuccessState) {
                            {
                              showToast(
                                  text: AppStrings.codeSendedSuccessFully1, state: ToastStates.SUCCESS);
                              navigateFinalTo(
                                  context: context,
                                  screenRoute: Routes.otpPasswordScreen);
                            }

                          } else if (state is SendCodeErrorState) {
                            showToast(
                                text: AppStrings.codeSendError1,
                                state: ToastStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: state is! SendCodeLoadingState,
                            builder: (context) =>  VerificationCode(
                              textStyle: Theme.of(context).textTheme.bodyText2!
                                  .copyWith(color: Theme.of(context).primaryColor),
                              keyboardType: TextInputType.number,
                              underlineColor: AppColors.offBlue,
                              length: 6,
                              cursorColor: Colors.blue,
                              onCompleted: (String value) {
                                if (_formKey.currentState!.validate()) {
                                  ConfirmPasswordCubit.get(context)
                                      .sendCode(code:int.parse(value) ,);
                                }
                              },
                              onEditing: (bool value) {},
                              margin: const EdgeInsets.all(12),
                            ),
                            fallback: (context) =>
                            const CircularProgressIndicator(),
                          );
                        },
                      ),
                      MainButton(
                        title: AppStrings.codeSendButton,
                        onPressed: () async {
                          navigateFinalTo(
                              context: context,
                              screenRoute: Routes.homeScreen);


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
