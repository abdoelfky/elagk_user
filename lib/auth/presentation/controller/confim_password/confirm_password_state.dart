
abstract class ConfirmPasswordStates {}

class ConfirmPasswordInitialState extends ConfirmPasswordStates {}

class SendCodeLoadingState extends ConfirmPasswordStates {}

class SendCodeSuccessState extends ConfirmPasswordStates
{
}

class SendCodeErrorState extends ConfirmPasswordStates
{
  final String error;

  SendCodeErrorState(this.error);
}