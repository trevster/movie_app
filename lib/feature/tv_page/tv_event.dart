part of 'tv_bloc.dart';

@immutable
abstract class TvEvent {
  const TvEvent();
}

class GetTvOnAir extends TvEvent {
  final bool isRefresh;

  const GetTvOnAir({
    this.isRefresh = false,
  });
}
