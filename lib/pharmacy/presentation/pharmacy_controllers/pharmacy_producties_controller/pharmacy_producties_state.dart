abstract class PharmacyProductiesStates {}

class PharmacyProductiesInitialState extends PharmacyProductiesStates {}

class GetProductiesLoadingState extends PharmacyProductiesStates {}

class GetProductiesSuccessState extends PharmacyProductiesStates {}

class GetProductiesErrorState extends PharmacyProductiesStates
{
  final error;

  GetProductiesErrorState(this.error);
}
