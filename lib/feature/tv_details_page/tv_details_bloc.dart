import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie/FailedRequestModel.dart';
import 'package:movie_app/models/tv/TvDetailsWithReviewsModel.dart';
import 'package:movie_app/network/movie_network.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:movie_app/repository/tv_repository.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  TvDetailsBloc() : super(const TvDetailsState()) {
    on<GetTvDetails>(_mapGetTvDetailsToState);
  }

  _mapGetTvDetailsToState(GetTvDetails event, Emitter<TvDetailsState> emit) async {
    final TvRepository tvRepository = TvRepository();
    final ResponseModel responseModel = await tvRepository.getTvDetailWithReviews(tvId: event.tvId);
    if (responseModel.response?.statusCode == 200) {
      final TvDetailsWithReviewsModel tvDetailWithReviewsModel = responseModel.decodedResponse!;
      if (tvDetailWithReviewsModel.reviews!.results!.isEmpty) {
        emit(state.copyWith(tvDetailStatus: TvDetailStatus.empty));
      }
      emit(state.copyWith(
        tvDetailWithReviewsModel: tvDetailWithReviewsModel,
        reviews: tvDetailWithReviewsModel.reviews,
        tvDetailStatus: TvDetailStatus.loaded,
      ));
    } else {
      final FailedRequestModel failedRequestModel = responseModel.decodedResponse!;
      emit(state.copyWith(
        tvDetailStatus: TvDetailStatus.error,
        message: 'Error ${failedRequestModel.statusCode} : ${failedRequestModel.statusMessage}',
      ));
    }
  }
}
