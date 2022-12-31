
abstract class OnboardingStates {}

class OnboardingInitialState extends OnboardingStates {}

class OnboardingLoadingState extends OnboardingStates {}

class OnboardingSuccessState extends OnboardingStates
{
}
class ChangeOnBoardingState extends OnboardingStates{}

class OnboardingErrorState extends OnboardingStates
{
  final String error;

  OnboardingErrorState(this.error);
}
