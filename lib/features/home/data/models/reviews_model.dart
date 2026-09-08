class ReviewModel {
  final String userName;
  final String comment;
  final int rating;
  final String date;

  ReviewModel({
    required this.userName,
    required this.comment,
    required this.rating,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['userName'],
      comment: json['comment'],
      rating: json['rating'],
      date: json['createdAt'].toString().split('T')[0],
    );
  }
}
