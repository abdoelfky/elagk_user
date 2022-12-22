part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable {
  const MedicineEvent();

  @override
  List<Object?> get props => [];
}

class AddMedicineEvent extends MedicineEvent {
  final BuildContext context;
  final String? userId;
  final int? pharmacyId;
  final int? productId;
  final String productName;
  final String? productDescription;
  final double? productPrice;
  final double? discountPercent;
  final File? productImage;
  final int? quantity;
  final int? point;
  final String? dose;
  final int? categoryId;
  final String? categoryName;
  final String? createdAt;

  const AddMedicineEvent({
    required this.context,
    this.userId,
    this.pharmacyId,
    this.productId,
    required this.productName,
    this.productDescription,
    this.productPrice,
    this.discountPercent,
    this.productImage,
    this.quantity,
    this.point,
    this.dose,
    this.categoryId,
    this.categoryName,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        context,
        userId,
        productId,
        productName,
        productDescription,
        productPrice,
        discountPercent,
        productImage,
        quantity,
        point,
        dose,
        categoryId,
        categoryName,
        createdAt,
      ];
}

class DeleteMedicineEvent extends MedicineEvent {
  final BuildContext context;
  final int id;

  const DeleteMedicineEvent({required this.context, required this.id});

  @override
  List<Object> get props => [context, id];
}

class GetMedicineEvent extends MedicineEvent {
  final int id;

  const GetMedicineEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateMedicineEvent extends MedicineEvent {
  final BuildContext context;
  final String? userId;
  final int productId;
  final String productName;
  final String? productDescription;
  final double? productPrice;
  final double? discountPercent;
  final File? productImage;
  final String? imageUrl;
  final int? quantity;
  final int? point;
  final String? dose;
  final int? categoryId;
  final String? categoryName;
  final String? createdAt;

  const UpdateMedicineEvent({
    required this.context,
    this.userId,
    required this.productId,
    required this.productName,
    this.productDescription,
    this.productPrice,
    this.discountPercent,
    this.productImage,
    this.imageUrl,
    this.quantity,
    this.point,
    this.dose,
    this.categoryId,
    this.categoryName,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        context,
        userId,
        productId,
        productName,
        productDescription,
        productPrice,
        discountPercent,
        productImage,
        imageUrl,
        quantity,
        point,
        dose,
        categoryId,
        categoryName,
        createdAt,
      ];
}

class InitTextControllersEvent extends MedicineEvent {
  final String productName;
  final String productDetails;
  final String productPrice;
  final String discountPercent;
  final String categoryName;
  final String quantity;
  final String dose;

  const InitTextControllersEvent({
    required this.productName,
    required this.productDetails,
    required this.productPrice,
    required this.discountPercent,
    required this.categoryName,
    required this.quantity,
    required this.dose,
  });

  @override
  List<Object> get props => [
        productName,
        productDetails,
        productPrice,
        discountPercent,
        categoryName,
        quantity,
        dose,
      ];
}
