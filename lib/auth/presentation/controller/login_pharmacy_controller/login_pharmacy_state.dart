part of 'login_pharmacy_bloc.dart';

class LoginPharmacyState extends Equatable {
  final LoginPharmacy? loginPharmacy;
  final RequestState loginRequestState;
  final ButtonState loginButtonState;
  final String loginMessage;

  const LoginPharmacyState({
    this.loginPharmacy,
    this.loginRequestState = RequestState.loading,
    this.loginButtonState = ButtonState.static,
    this.loginMessage = AppConstants.empty,
  });

  LoginPharmacyState copyWith({
    LoginPharmacy? loginPharmacy,
    RequestState? loginRequestState,
    ButtonState? loginButtonState,
    String? loginMessage,
  }) {
    return LoginPharmacyState(
      loginPharmacy: loginPharmacy ?? this.loginPharmacy,
      loginRequestState: loginRequestState ?? this.loginRequestState,
      loginButtonState: loginButtonState ?? this.loginButtonState,
      loginMessage: loginMessage ?? this.loginMessage,
    );
  }

  @override
  List<Object?> get props => [
        loginPharmacy,
        loginRequestState,
        loginButtonState,
        loginMessage,
      ];
}
