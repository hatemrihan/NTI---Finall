class ProductModel {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String coverPictureUrl;
  final int? stock;
  final List<String> categoryIds;
  final List<String>? productPictureUrls;
  final String sellerId;
  final String? nameArabic;
  final String? color;
  final String? descriptionArabic;

  ProductModel({
     this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.coverPictureUrl,
    required this.stock,
    required this.categoryIds,
    this.productPictureUrls,
    required this.sellerId,
    this.nameArabic,
    this.color,
    this.descriptionArabic,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      categoryIds:
          (json['categoryIds'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      stock: (json['stock'] as num?)?.toInt(),
      productPictureUrls: [],
      sellerId: '',
      nameArabic: json['nameArabic'] ?? '',
      color: json['color'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
     'id': id ,
      'sellerId': sellerId,
      'name': name,
      'description': description,
      'price': price,
      'coverPictureUrl': coverPictureUrl,
      'stock': stock,
      'categoryIds': categoryIds,
      'productPictureUrls': productPictureUrls,
      'nameArabic': nameArabic,
      'color': color,
      'descriptionArabic': descriptionArabic,
      'weight': 3581.52,
      'discountPercentage': 4,
    };
  }
}
