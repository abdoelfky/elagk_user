import 'dart:async';

import 'package:elagk_pharmacy/auth/domain/entities/email_activation_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/forget_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/reset_password_entity.dart';
import 'package:elagk_pharmacy/auth/domain/entities/send_mail_entity.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/activate_email_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/forget_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/reset_password_usecase.dart';
import 'package:elagk_pharmacy/auth/domain/usecases/send_mail_usecase.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app__fonts.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/argument_models.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final SendMailUseCase sendMailUseCase;
  final ActivateEmailUseCase activateEmailUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  PasswordBloc(
    this.forgetPasswordUseCase,
    this.sendMailUseCase,
    this.activateEmailUseCase,
    this.resetPasswordUseCase,
  ) : super(const PasswordState()) {
    on<ForgetPasswordEvent>(_forgetPassword);
    on<SendMailEvent>(_sendMail);
    on<ActivationEmailEvent>(_activateEmail);
    on<ResetPasswordEvent>(_resetPassword);
  }

  // Forget password screen
  FutureOr<void> _forgetPassword(
      ForgetPasswordEvent event, Emitter<PasswordState> emit) async {
    emit(state.copyWith(forgetPasswordButtonState: ButtonState.loading));
    final result = await forgetPasswordUseCase(
      ForgetPasswordParameters(email: event.email),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          forgetPasswordRequestState: RequestState.error,
          forgetPasswordButtonState: ButtonState.static,
          forgetPasswordMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          forgetPasswordRequestState: RequestState.loaded,
          forgetPasswordButtonState: ButtonState.static,
          forgetPassword: r,
        ),
      );
      if (state.forgetPassword!.email == event.email) {
        navigateTo(
          context: event.context,
          screenRoute: Routes.otpVerifyScreen,
          arguments: OTPArguments(
            email: event.email,
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Email ${state.forgetPassword!.email}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: AppColors.red,
          textColor: Colors.white,
          fontSize: FontSize.s16,
        );
      }
    });
  }

  // Send mail
  FutureOr<void> _sendMail(
      SendMailEvent event, Emitter<PasswordState> emit) async {
    final result = await sendMailUseCase(
      SendMailParameters(email: event.email),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          sendMailRequestState: RequestState.error,
          sendMailMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          sendMailRequestState: RequestState.loaded,
          sendMail: r,
        ),
      );
    });
  }

  // Activate email screen
  int? pinCode;

  submitPinCode(int pin) {
    pinCode = pin;
  }

  FutureOr<void> _activateEmail(
      ActivationEmailEvent event, Emitter<PasswordState> emit) async {
    emit(state.copyWith(emailActivationButtonState: ButtonState.loading));
    final result = await activateEmailUseCase(
      ActivationParameters(code: event.code),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            emailActivationRequestState: RequestState.error,
            emailActivationButtonState: ButtonState.static,
            emailActivationMessage: l.message,
          ),
        );
        Fluttertoast.showToast(
          msg: l.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: AppColors.red,
          textColor: Colors.white,
          fontSize: FontSize.s16,
        );
      },
      (r) {
        emit(
          state.copyWith(
            emailActivationRequestState: RequestState.loaded,
            emailActivationButtonState: ButtonState.static,
            emailActivation: r,
          ),
        );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.resetPasswordScreen,
        );
      },
    );
  }

  // Reset password screen
  FutureOr<void> _resetPassword(
      ResetPasswordEvent event, Emitter<PasswordState> emit) async {
    emit(state.copyWith(resetPasswordButtonState: ButtonState.loading));
    final result = await resetPasswordUseCase(
      ResetPasswordParameters(
        password: event.password,
        email: event.email,
      ),
    );
    result.fold((l) {
      emit(
        state.copyWith(
          resetPasswordRequestState: RequestState.error,
          resetPasswordButtonState: ButtonState.static,
          resetPasswordMessage: l.message,
        ),
      );
      Fluttertoast.showToast(
        msg: l.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: AppColors.red,
        textColor: Colors.white,
        fontSize: FontSize.s16,
      );
    }, (r) {
      emit(
        state.copyWith(
          resetPasswordRequestState: RequestState.loaded,
          resetPasswordButtonState: ButtonState.static,
          resetPassword: r,
        ),
      );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.loginPharmacyScreen,
        );
    });
  }
}
