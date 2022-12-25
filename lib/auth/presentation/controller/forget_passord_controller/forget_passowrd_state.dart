

abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class SendOTPLoadingState extends ForgetPasswordStates {}

class SendOTPSuccessState extends ForgetPasswordStates
{
}

class SendOTPErrorState extends ForgetPasswordStates
{
  final String error;

  SendOTPErrorState(this.error);
}