class ImageSlideShowArguments {
  final String image;

  const ImageSlideShowArguments({required this.image});
}

class OTPArguments {
  final String email;

  const OTPArguments({required this.email});
}

class UpdateMedicineArguments {
  final int productId;
  final String productName;
  final String description;
  final String imageUrl;
  final double price;
  final double discountPercent;
  final int categoryId;
  final String categoryName;
  final int quantity;
  final String dose;

  UpdateMedicineArguments({
    required this.productId,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.discountPercent,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    required this.dose,
  });
}
