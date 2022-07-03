part of 'tv_details_bloc.dart';

enum TvDetailStatus {
  loading,
  loaded,
  empty,
  error,
}

@immutable
class TvDetailsState extends Equatable {
  final TvDetailsWithReviewsModel? tvDetailWithReviewsModel;
  final Reviews? reviews;
  final TvDetailStatus tvDetailStatus;
  final String message;

  const TvDetailsState({
    this.reviews,
    this.tvDetailWithReviewsModel,
    this.tvDetailStatus = TvDetailStatus.loading,
    this.message = '',
  });

  TvDetailsState copyWith({
    Reviews? reviews,
    TvDetailsWithReviewsModel? tvDetailWithReviewsModel,
    TvDetailStatus? tvDetailStatus,
    String? message,
  }) =>
      TvDetailsState(
        reviews: reviews ?? this.reviews,
        message: message ?? this.message,
        tvDetailStatus: tvDetailStatus ?? this.tvDetailStatus,
        tvDetailWithReviewsModel: tvDetailWithReviewsModel ?? this.tvDetailWithReviewsModel,
      );

  @override
  List<Object?> get props => [
        tvDetailStatus,
        tvDetailWithReviewsModel,
        reviews,
        message,
      ];
}
