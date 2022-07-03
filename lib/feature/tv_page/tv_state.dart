part of 'tv_bloc.dart';

enum TvViewStatus {
  loading,
  loaded,
  empty,
  error,
}

class TvState extends Equatable {
  final TvViewStatus tvViewState;
  final int page;
  final bool hasReachedMax;
  final List<Results> listTvOnAir;
  final List<Results> listPopular;
  final String message;

  const TvState({
    this.page = 1,
    this.hasReachedMax = false,
    this.listTvOnAir = const <Results>[],
    this.listPopular = const <Results>[],
    this.message = '',
    this.tvViewState = TvViewStatus.loading,
  });

  TvState copyWith({
    TvViewStatus? tvViewState,
    List<Results>? listTvOnAir,
    List<Results>? listPopular,
    String? message,
    int? page,
    bool? hasReachedMax,
  }) =>
      TvState(
        tvViewState: tvViewState ?? this.tvViewState,
        listTvOnAir: listTvOnAir ?? this.listTvOnAir,
        listPopular: listPopular ?? this.listPopular,
        message: message ?? this.message,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        tvViewState,
        listTvOnAir,
        listPopular,
        message,
        page,
        hasReachedMax,
      ];
}
