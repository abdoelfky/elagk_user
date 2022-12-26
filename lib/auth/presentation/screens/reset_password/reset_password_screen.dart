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
import '../../components/MainTextFormField.dart';
import '../../components/auth_title_subtitle_widget.dart';
import '../../components/logo_widget.dart';
import '../../components/main_button.dart';
import '../../components/screen_background.dart';
import '../../controller/forget_passord_controller/forget_passowrd_state.dart';
import '../../controller/reset_password_controller/reset_password_cubit.dart';
import '../../controller/reset_password_controller/reset_password_state.dart';
import '../forget_password/forget_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _passwordController = TextEditingController();
  static final _emailController = TextEditingController();

  static const countdownDuration = Duration(minutes: 10);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  Duration duration = Duration();

  Timer? timer;

  bool countDown =true;

  @override
  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  void reset(){
    if (countDown){
      setState(() =>
      duration = ResetPasswordScreen.countdownDuration);
    } else{
      setState(() =>
      duration = Duration());
    }
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void addTime(){
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
      } else{
        duration = Duration(seconds: seconds);

      }
    });
  }

  void stopTimer({bool resets = true}){
    if (resets){
      reset();
    }
    setState(() => timer?.cancel());
  }

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
                  key: ResetPasswordScreen._formKey,
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
                        controller: ResetPasswordScreen._passwordController,
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
                      buildTime(duration),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      FlutterPwValidator(
                        successColor: AppColors.primary,

                        controller: ResetPasswordScreen._passwordController,
                        minLength: 8,
                        uppercaseCharCount: 1,
                        numericCharCount: 3,
                        specialCharCount: 1,
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
                                  screenRoute: Routes.loginScreen);
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
                                  if (ResetPasswordScreen._formKey.currentState!.validate()) {
                                    ResetPasswordCubit.get(context)
                                        .ResetPass(
                                        password: ResetPasswordScreen._passwordController.toString(),
                                      email: ResetPasswordScreen._emailController.toString()
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

Widget buildTime(duration){
  String twoDigits(int n) => n.toString().padLeft(2,'0');

  final minutes =twoDigits(duration.inMinutes.remainder(60));
  final seconds =twoDigits(duration.inSeconds.remainder(60));
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 8,),
        buildTimeCard(time: seconds, header:'SECONDS'),
        SizedBox(width: 8,),
        buildTimeCard(time: minutes, header:'MINUTES'),
      ]
  );
}

Widget buildTimeCard({required String time, required String header}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            time, style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,fontSize: 50),),
        ),
        SizedBox(height: 24,),
        Text(header,style: TextStyle(color: Colors.black45)),
      ],
    );