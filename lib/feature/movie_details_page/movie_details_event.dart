part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class GetMovieDetails extends MovieDetailsEvent {
  final int movieId;
  const GetMovieDetails(this.movieId);
}
