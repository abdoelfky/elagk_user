part of 'elagk_store_cubit.dart';

@immutable
abstract class ElagkStoreState {}

class ElagkStoreInitial extends ElagkStoreState {}

class GetElagkStoreCategoriesLoadingState extends ElagkStoreState {}

class GetElagkStoreCategoriesSuccessState extends ElagkStoreState {}

class GetElagkStoreCategoriesErrorState extends ElagkStoreState
{
  final error;

  GetElagkStoreCategoriesErrorState(this.error);
}

class GetElagkStoreProductiesLoadingState extends ElagkStoreState {}

class GetElagkStoreProductiesSuccessState extends ElagkStoreState {}

class GetElagkStoreProductiesErrorState extends ElagkStoreState
{
  final error;

  GetElagkStoreProductiesErrorState(this.error);
}

class ChangeSelectedCategorySuccessState extends ElagkStoreState {}


class SearchDoneSuccessState extends ElagkStoreState {}
class SearchWordChangedSuccessState extends ElagkStoreState {}
class SearchDeletedSuccessState extends ElagkStoreState {}

