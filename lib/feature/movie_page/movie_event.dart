part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {
  const MovieEvent();
}

class GetNowPlaying extends MovieEvent {
  final bool isRefresh;

  const GetNowPlaying({
    this.isRefresh = false,
  });
}
