import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/FailedRequestModel.dart';
import 'package:movie_app/models/MovieDetailWithReviewsModel.dart';
import 'package:movie_app/network/movie_network.dart';
import 'package:movie_app/repository/movie_repository.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(const MovieDetailsState()) {
    on<GetMovieDetails>(_mapGetMovieDetailsToState);
  }

  _mapGetMovieDetailsToState(GetMovieDetails event, Emitter<MovieDetailsState> emit) async {
    final MovieRepository movieRepository = MovieRepository();
    final ResponseModel responseModel = await movieRepository.getMovieDetailWithReviews(movieId: event.movieId);
    if (responseModel.response?.statusCode == 200) {
      final MovieDetailWithReviewsModel movieDetailWithReviewsModel = responseModel.decodedResponse!;
      if (movieDetailWithReviewsModel.title!.isEmpty) {
        emit(state.copyWith(movieDetailStatus: MovieDetailStatus.empty));
      }
      emit(state.copyWith(
        movieDetailWithReviewsModel: movieDetailWithReviewsModel,
        reviews: movieDetailWithReviewsModel.reviews,
        movieDetailStatus: MovieDetailStatus.loaded,
      ));
    } else {
      final FailedRequestModel failedRequestModel = responseModel.decodedResponse!;
      emit(state.copyWith(
        movieDetailStatus: MovieDetailStatus.error,
        message: 'Error ${failedRequestModel.statusCode} : ${failedRequestModel.statusMessage}',
      ));
    }
  }
}
