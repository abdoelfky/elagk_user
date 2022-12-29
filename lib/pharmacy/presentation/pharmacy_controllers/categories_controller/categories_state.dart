abstract class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates
{
}

class CategoriesErrorState extends CategoriesStates
{
  final String error;

  CategoriesErrorState(this.error);
}