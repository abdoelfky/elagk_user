
abstract class ActivatorStates {}

class ActivatorInitialState extends ActivatorStates {}

class ActivatorLoadingState extends ActivatorStates {}

class ActivatorSuccessState extends ActivatorStates
{
}

class ActivatorErrorState extends ActivatorStates
{
  final String error;

  ActivatorErrorState(this.error);
}

class ChangeDurationLoadingState extends ActivatorStates {}

class ChangeDurationStartState extends ActivatorStates {

}

class ChangeDurationEndState extends ActivatorStates {}

