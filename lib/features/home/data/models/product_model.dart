class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String coverPictureUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.coverPictureUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      coverPictureUrl: json['coverPictureUrl'] ?? '',
    );
  }
}
