abstract class BasketStates {}

class InitialState extends BasketStates
{
  
}
// counter
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

class CalculatedSuccessfullyState extends BasketStates {}

class CheckIfContainedSuccessfullyState extends BasketStates {}


// API CART
class GetCartIdLoadingState extends BasketStates {}

class GetCartIdSuccessState extends BasketStates {}

class GetCartIdErrorState extends BasketStates
{
  final String error;

  GetCartIdErrorState(this.error);
}

class PostCartSuccessState extends BasketStates {}

class PostCartLoadingState extends BasketStates {}

class PostCartErrorState extends BasketStates
{
  final String error;

  PostCartErrorState(this.error);
}

class PutCartOrderLoadingState extends BasketStates {}

class PutCartOrderSuccessState extends BasketStates {}

class PostCartOrderSuccessState extends BasketStates {}

class PostCartOrderLoadingState extends BasketStates {}

class PostCartOrderErrorState extends BasketStates
{
  final String error;

  PostCartOrderErrorState(this.error);
}


//API POST ORDER FINALLY
class PostOrderSuccessState extends BasketStates {}

class PostOrderLoadingState extends BasketStates {}

class PostOrderErrorState extends BasketStates
{
  final String error;

  PostOrderErrorState(this.error);
}

class DeleteCartProductsSuccessState extends BasketStates {}

class UpdatePointsSuccessState extends BasketStates {}

