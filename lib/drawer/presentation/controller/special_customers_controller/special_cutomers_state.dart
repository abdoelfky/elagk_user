part of 'special_cutomers_cubit.dart';

@immutable
abstract class SpecialCustomersState{}

class SpecialCustomersInitial extends SpecialCustomersState {}
class GetSpecialCustomersLoadingState extends SpecialCustomersState {}
class GetSpecialCustomersSuccessState extends SpecialCustomersState
{
  final List<SpecialCustomerModel> specialCustomers;

  GetSpecialCustomersSuccessState(this.specialCustomers);
}
class GetSpecialCustomersErrorState extends SpecialCustomersState
{
  final String error;

  GetSpecialCustomersErrorState(this.error);
}
