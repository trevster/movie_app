import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie/FailedRequestModel.dart';
import 'package:movie_app/models/tv/TvOnAirModel.dart';
import 'package:movie_app/network/movie_network.dart';
import 'package:movie_app/repository/tv_repository.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  TvBloc() : super(const TvState()) {
    on<GetTvOnAir>(_mapGetNowPlayingToState);
  }

  _mapGetNowPlayingToState(GetTvOnAir event, Emitter<TvState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(
        page: 1,
        hasReachedMax: false,
        listResult: <Results>[],
      ));
    }

    if (state.hasReachedMax) return;

    TvRepository tvRepository = TvRepository();
    final ResponseModel responseModel = await tvRepository.getTvOnAir(
      page: state.page,
    );
    if (responseModel.response?.statusCode == 200) {
      final TvOnAirModel tvOnAirModel = responseModel.decodedResponse!;
      if (tvOnAirModel.results!.isEmpty) {
        emit(state.copyWith(tvViewState: TvViewStatus.empty));
      }
      emit(state.copyWith(
        listResult: tvOnAirModel.results,
        tvViewState: TvViewStatus.loaded,
        page: state.page + 1,
        hasReachedMax: state.page >= tvOnAirModel.totalPages!,
      ));
    } else {
      final FailedRequestModel failedRequestModel = responseModel.decodedResponse!;
      emit(state.copyWith(
        tvViewState: TvViewStatus.error,
        message: 'Error ${failedRequestModel.statusCode} : ${failedRequestModel.statusMessage}',
      ));
    }
  }
}
