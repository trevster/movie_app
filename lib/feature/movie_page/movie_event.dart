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

class GetUpcoming extends MovieEvent {
  final bool isRefresh;

  const GetUpcoming({
    this.isRefresh = false,
  });
}

class GetPopular extends MovieEvent {
  final bool isRefresh;

  const GetPopular({
    this.isRefresh = false,
  });
}
