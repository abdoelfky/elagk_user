


abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPassLoadingState extends ResetPasswordStates {}

class ResetPassSuccessState extends ResetPasswordStates
{
}

class ResetPassErrorState extends ResetPasswordStates
{
  final String error;

  ResetPassErrorState(this.error);
}