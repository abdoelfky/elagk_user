abstract class BasketStates {}

class InitialState extends BasketStates
{
  
}

class PlusState extends BasketStates {}

class MinusState extends BasketStates {}

class AddToBasketSuccessState extends BasketStates {}

class AddToBasketLoadingState extends BasketStates {}

class AddToBasketErrorState extends BasketStates
{
  final String error;

  AddToBasketErrorState(this.error);
}

class removeFromCartLoadingState extends BasketStates {}

class removeFromCartSuccessState extends BasketStates {}