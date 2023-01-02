abstract class PharmacyProductiesStates {}

class PharmacyProductiesInitialState extends PharmacyProductiesStates {}


class GetCategoriesLoadingState extends PharmacyProductiesStates {}

class GetCategoriesSuccessState extends PharmacyProductiesStates {}

class GetCategoriesErrorState extends PharmacyProductiesStates
{
  final error;

  GetCategoriesErrorState(this.error);
}

class GetProductiesLoadingState extends PharmacyProductiesStates {}

class GetProductiesSuccessState extends PharmacyProductiesStates {}

class GetProductiesErrorState extends PharmacyProductiesStates
{
  final error;

  GetProductiesErrorState(this.error);
}

class ChangeSelectedCategorySuccessState extends PharmacyProductiesStates {}

