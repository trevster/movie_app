part of 'movie_details_bloc.dart';

enum MovieDetailStatus {
  loading,
  loaded,
  empty,
  error,
}

@immutable
class MovieDetailsState extends Equatable {
  final MovieDetailWithReviewsModel? movieDetailWithReviewsModel;
  final Reviews? reviews;
  final MovieDetailStatus movieDetailStatus;
  final String message;

  const MovieDetailsState({
    this.reviews,
    this.movieDetailWithReviewsModel,
    this.movieDetailStatus = MovieDetailStatus.loading,
    this.message = '',
  });

  MovieDetailsState copyWith({
    Reviews? reviews,
    MovieDetailWithReviewsModel? movieDetailWithReviewsModel,
    MovieDetailStatus? movieDetailStatus,
    String? message,
  }) =>
      MovieDetailsState(
        reviews: reviews ?? this.reviews,
        message: message ?? this.message,
        movieDetailStatus: movieDetailStatus ?? this.movieDetailStatus,
        movieDetailWithReviewsModel: movieDetailWithReviewsModel ?? this.movieDetailWithReviewsModel,
      );

  @override
  List<Object?> get props => [
        movieDetailStatus,
        movieDetailWithReviewsModel,
        reviews,
        message,
      ];
}
