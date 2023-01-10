
abstract class StepperState {}

class StepperInitial extends StepperState {}

class OrderFollowLoadingState extends StepperState{}
class OrderFollowSuccessState extends StepperState{}
class OrderFollowErrorState extends StepperState{}