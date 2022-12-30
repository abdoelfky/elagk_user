abstract class OrderByPerscripiyionStates {}

class OrderByPerscripiyionInitialState extends OrderByPerscripiyionStates {}

class OrderByPerscripiyionLoadingState extends OrderByPerscripiyionStates {}

class OrderByPerscripiyionSuccessState extends OrderByPerscripiyionStates
{
}

class OrderByPerscripiyionErrorState extends OrderByPerscripiyionStates
{
  final String error;

  OrderByPerscripiyionErrorState(this.error);
}



class PickImageLoadingState extends OrderByPerscripiyionStates {}

class PickImageSuccessState extends OrderByPerscripiyionStates
{
}