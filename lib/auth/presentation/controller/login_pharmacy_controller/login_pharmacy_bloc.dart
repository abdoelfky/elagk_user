import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app__fonts.dart';
import '../../../../shared/utils/app_constants.dart';
import '../../../../shared/utils/app_routes.dart';
import '../../../../shared/utils/enums.dart';
import '../../../../shared/utils/navigation.dart';

part 'login_pharmacy_event.dart';

part 'login_pharmacy_state.dart';

class LoginPharmacyBloc extends Bloc<LoginPharmacyEvent, LoginPharmacyState> {
  final LoginUseCase loginUseCase;

  LoginPharmacyBloc(this.loginUseCase) : super(const LoginPharmacyState()) {
    on<LoginEvent>(_login);
  }

  FutureOr<void> _login(
      LoginEvent event, Emitter<LoginPharmacyState> emit) async {
    emit(state.copyWith(loginButtonState: ButtonState.loading));
    final result = await loginUseCase(
      LoginParameters(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            loginRequestState: RequestState.error,
            loginButtonState: ButtonState.static,
            loginMessage: l.message,
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
            loginRequestState: RequestState.loaded,
            loginButtonState: ButtonState.static,
            loginPharmacy: r,
          ),
        );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.homeDrawerScreen,
        );
      },
    );
  }
}
