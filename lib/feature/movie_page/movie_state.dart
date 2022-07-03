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
  final List<Results> listResult;
  final String message;

  const MovieState({
    this.page = 1,
    this.hasReachedMax = false,
    this.listResult = const <Results>[],
    this.message = '',
    this.movieViewState = MovieViewState.loading,
  });

  MovieState copyWith({
    MovieViewState? movieViewState,
    List<Results>? listResult,
    String? message,
    int? page,
    bool? hasReachedMax,
  }) =>
      MovieState(
        movieViewState: movieViewState ?? this.movieViewState,
        listResult: listResult ?? this.listResult,
        message: message ?? this.message,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        movieViewState,
        listResult,
        message,
        page,
        hasReachedMax,
      ];
}
