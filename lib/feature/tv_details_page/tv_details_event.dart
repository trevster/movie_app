part of 'tv_details_bloc.dart';

@immutable
abstract class TvDetailsEvent {
  const TvDetailsEvent();
}

class GetTvDetails extends TvDetailsEvent {
  final int tvId;
  const GetTvDetails(this.tvId);
}
