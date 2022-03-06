class ProductDetailsModel {
  final String productName;
  final int age;
  final List<int> waterList;
  final String type;
  final List<String> images;
  final String categoryImage;

  ProductDetailsModel({
    required this.categoryImage,
    required this.images,
    required this.productName,
    required this.age,
    required this.waterList,
    required this.type,
  });
}
