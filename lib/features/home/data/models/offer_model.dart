class OfferModel {
  final String id;
  final String tag;
  final String title;
  final String subtitle;
  final String imageUrl;

  OfferModel({
    required this.id,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id']?.toString() ?? '',
      tag: json['tag'] ?? 'OFFER',
      title: json['name'] ?? json['title'] ?? '',
      subtitle: json['description'] ?? json['subtitle'] ?? '',
      imageUrl: json['coverUrl'] ?? json['imageUrl'] ?? json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag': tag,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
    };
  }
}
