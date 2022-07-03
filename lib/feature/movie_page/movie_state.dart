part of 'movie_bloc.dart';

enum MovieViewState {
  loading,
  loaded,
  empty,
  error,
}

@immutable
class MovieState extends Equatable {
  final MovieViewState movieViewState;
  final int page;
  final bool hasReachedMax;
  final List<Results> listNowPlaying;
  final List<Results> listUpcoming;
  final List<Results> listPopular;
  final String message;

  const MovieState({
    this.page = 1,
    this.hasReachedMax = false,
    this.listNowPlaying = const <Results>[],
    this.listUpcoming = const <Results>[],
    this.listPopular = const <Results>[],
    this.message = '',
    this.movieViewState = MovieViewState.loading,
  });

  MovieState copyWith({
    MovieViewState? movieViewState,
    List<Results>? listNowPlaying,
    List<Results>? listUpcoming,
    List<Results>? listPopular,
    String? message,
    int? page,
    bool? hasReachedMax,
  }) =>
      MovieState(
        movieViewState: movieViewState ?? this.movieViewState,
        listNowPlaying: listNowPlaying ?? this.listNowPlaying,
        listUpcoming: listUpcoming ?? this.listUpcoming,
        listPopular: listPopular ?? this.listPopular,
        message: message ?? this.message,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        movieViewState,
        listNowPlaying,
        listUpcoming,
        listPopular,
        message,
        page,
        hasReachedMax,
      ];
}
