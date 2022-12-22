part of 'password_bloc.dart';

class PasswordState extends Equatable {
  // Forget password screen
  final ForgetPassword? forgetPassword;
  final RequestState forgetPasswordRequestState;
  final ButtonState forgetPasswordButtonState;
  final String forgetPasswordMessage;

  // Send mail
  final SendMail? sendMail;
  final RequestState sendMailRequestState;
  final String sendMailMessage;

  // Activate email screen
  final EmailActivation? emailActivation;
  final RequestState emailActivationRequestState;
  final ButtonState emailActivationButtonState;
  final String emailActivationMessage;

  // Reset password screen
  final ResetPassword? resetPassword;
  final RequestState resetPasswordRequestState;
  final ButtonState resetPasswordButtonState;
  final String resetPasswordMessage;

  const PasswordState({
    // Forget password screen
    this.forgetPassword,
    this.forgetPasswordRequestState = RequestState.loading,
    this.forgetPasswordButtonState = ButtonState.static,
    this.forgetPasswordMessage = AppConstants.empty,
    // Send mail
    this.sendMail,
    this.sendMailRequestState = RequestState.loading,
    this.sendMailMessage = AppConstants.empty,
    // Activate email screen
    this.emailActivation,
    this.emailActivationRequestState = RequestState.loading,
    this.emailActivationButtonState = ButtonState.static,
    this.emailActivationMessage = AppConstants.empty,
    // Reset password screen
    this.resetPassword,
    this.resetPasswordRequestState = RequestState.loading,
    this.resetPasswordButtonState = ButtonState.static,
    this.resetPasswordMessage = AppConstants.empty,
  });

  PasswordState copyWith({
    // Forget password screen
    ForgetPassword? forgetPassword,
    RequestState? forgetPasswordRequestState,
    ButtonState? forgetPasswordButtonState,
    String? forgetPasswordMessage,
    // Send mail
    SendMail? sendMail,
    RequestState? sendMailRequestState,
    String? sendMailMessage,
    // Activate email screen
    EmailActivation? emailActivation,
    RequestState? emailActivationRequestState,
    ButtonState? emailActivationButtonState,
    String? emailActivationMessage,
    // Reset password screen
    ResetPassword? resetPassword,
    RequestState? resetPasswordRequestState,
    ButtonState? resetPasswordButtonState,
    String? resetPasswordMessage,
  }) {
    return PasswordState(
      // Forget password screen
      forgetPassword: forgetPassword ?? this.forgetPassword,
      forgetPasswordRequestState:
          forgetPasswordRequestState ?? this.forgetPasswordRequestState,
      forgetPasswordButtonState:
          forgetPasswordButtonState ?? this.forgetPasswordButtonState,
      forgetPasswordMessage:
          forgetPasswordMessage ?? this.forgetPasswordMessage,
      // Send mail
      sendMail: sendMail ?? this.sendMail,
      sendMailRequestState: sendMailRequestState ?? this.sendMailRequestState,
      sendMailMessage: sendMailMessage ?? this.sendMailMessage,
      // Activate email screen
      emailActivation: emailActivation ?? this.emailActivation,
      emailActivationRequestState:
          emailActivationRequestState ?? this.emailActivationRequestState,
      emailActivationButtonState:
          emailActivationButtonState ?? this.emailActivationButtonState,
      emailActivationMessage:
          emailActivationMessage ?? this.emailActivationMessage,
      // Reset password screen
      resetPassword: resetPassword ?? this.resetPassword,
      resetPasswordRequestState:
          resetPasswordRequestState ?? this.resetPasswordRequestState,
      resetPasswordButtonState:
          resetPasswordButtonState ?? this.resetPasswordButtonState,
      resetPasswordMessage: resetPasswordMessage ?? this.resetPasswordMessage,
    );
  }

  @override
  List<Object?> get props => [
        // Forget password screen
        forgetPassword,
        forgetPasswordRequestState,
        forgetPasswordButtonState,
        forgetPasswordMessage,
        // Send mail
        sendMail,
        sendMailRequestState,
        sendMailMessage,
        // Activate email screen
        emailActivation,
        emailActivationRequestState,
        emailActivationButtonState,
        emailActivationMessage,
        // Reset password screen
        resetPassword,
        resetPasswordRequestState,
        resetPasswordButtonState,
        resetPasswordMessage,
      ];
}
