abstract class ReviewState {}

class ReviewInitialState extends ReviewState {}

class ReviewLoadingState extends ReviewState {}

class ReviewSuccessState extends ReviewState {}

class ReviewFailureState extends ReviewState {}


//* Add review states
class AddReviewLoadingState extends ReviewState {}

class AddReviewSuccessState extends ReviewState {}

class AddReviewAlreadyReviewedState extends ReviewState {}

class AddReviewFailureState extends ReviewState {}