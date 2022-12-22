part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {
  const GetCategoriesEvent();

  @override
  List<Object?> get props => [];
}

class ChangeCategoryIndexEvent extends CategoriesEvent {
  final int index;

  const ChangeCategoryIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SelectCategoryEvent extends CategoriesEvent {
  final String categoryName;

  const SelectCategoryEvent(this.categoryName);

  @override
  List<Object?> get props => [categoryName];
}

class SelectCategoryIdEvent extends CategoriesEvent {
  final int categoryId;

  const SelectCategoryIdEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class GetMedicinesEvent extends CategoriesEvent {
  final String categoryName;

  const GetMedicinesEvent({required this.categoryName});

  @override
  List<Object?> get props => [categoryName];
}
