import 'package:final_project/features/reviews/data/data_source/reviews_remote_data_source.dart';
import 'package:final_project/features/reviews/presentation/reviews_cubit/reviews_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/features/home/data/models/reviews_model.dart';


class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitialState());
  final ReviewRemoteDataSource reviewRemoteDataSource = ReviewRemoteDataSource();
  List<ReviewModel> reviews = [];
  double averageRating = 0;
  int reviewsCount = 0;

  Future<void> getReviews({required String productId}) async {
    emit(ReviewLoadingState());
    try {
      final data = await reviewRemoteDataSource.getReviews( productId: productId,
      );
      averageRating = (data['averageRating'] ?? 0).toDouble();
      reviewsCount = data['reviewsCount'] ?? 0;
      reviews.clear();
      for (var element in data['reviews']['items']) {
        reviews.add(ReviewModel.fromJson(element));
      }
      emit(ReviewSuccessState());
    } catch (e) {
      emit(ReviewFailureState());
    }
  }
}