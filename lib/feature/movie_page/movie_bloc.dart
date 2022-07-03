import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie/FailedRequestModel.dart';
import 'package:movie_app/models/movie/NowPlayingModel.dart';
import 'package:movie_app/network/movie_network.dart';
import 'package:movie_app/repository/movie_repository.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<GetNowPlaying>(_mapGetNowPlayingToState);
  }

  _mapGetNowPlayingToState(GetNowPlaying event, Emitter<MovieState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(
        page: 1,
        hasReachedMax: false,
        listResult: <Results>[],
      ));
    }

    if (state.hasReachedMax) return;

    MovieRepository movieRepository = MovieRepository();
    final ResponseModel responseModel = await movieRepository.getNowPlaying(
      page: state.page,
    );
    if (responseModel.response?.statusCode == 200) {
      final NowPlayingModel nowPlayingModel = responseModel.decodedResponse!;
      if (nowPlayingModel.results!.isEmpty) {
        emit(state.copyWith(movieViewState: MovieViewState.empty));
      }
      emit(state.copyWith(
        listResult: nowPlayingModel.results,
        movieViewState: MovieViewState.loaded,
        page: state.page + 1,
        hasReachedMax: state.page >= nowPlayingModel.totalPages!,
      ));
    } else {
      final FailedRequestModel failedRequestModel = responseModel.decodedResponse!;
      emit(state.copyWith(
        movieViewState: MovieViewState.error,
        message: 'Error ${failedRequestModel.statusCode} : ${failedRequestModel.statusMessage}',
      ));
    }
  }
}
