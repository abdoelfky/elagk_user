part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  final List<Category>? category;
  final List<String> categoriesName;
  final String? selectedCategory;
  final RequestState categoryRequestState;
  final String categoryMessage;
  final int selectedIndex;

  // Medicines
  final List<Medicine>? medicines;
  final RequestState medicinesRequestState;
  final String medicinesMessage;

  const CategoriesState({
    this.category,
    this.categoriesName = const [],
    this.selectedCategory,
    this.categoryRequestState = RequestState.loading,
    this.categoryMessage = AppConstants.empty,
    this.selectedIndex = 0,
    // Medicines
    this.medicines,
    this.medicinesRequestState = RequestState.loading,
    this.medicinesMessage = AppConstants.empty,
  });

  CategoriesState copyWith({
    List<Category>? category,
    List<String>? categoriesName,
    String? selectedCategory,
    RequestState? categoryRequestState,
    String? categoryMessage,
    int? selectedIndex,
    // Medicines
    List<Medicine>? medicines,
    RequestState? medicinesRequestState,
    String? medicinesMessage,
  }) {
    return CategoriesState(
      category: category ?? this.category,
      categoriesName: categoriesName ?? this.categoriesName,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryRequestState: categoryRequestState ?? this.categoryRequestState,
      categoryMessage: categoryMessage ?? this.categoryMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      // Medicines
      medicines: medicines ?? this.medicines,
      medicinesRequestState: medicinesRequestState ?? this.medicinesRequestState,
      medicinesMessage: medicinesMessage ?? this.medicinesMessage,
    );
  }

  @override
  List<Object?> get props => [
        category,
        categoriesName,
        selectedCategory,
        categoryRequestState,
        categoryMessage,
        selectedIndex,
        // Medicines
        medicines,
        medicinesRequestState,
        medicinesMessage,
      ];
}
