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
  final List<Results> listResult;
  final String message;

  const TvState({
    this.page = 1,
    this.hasReachedMax = false,
    this.listResult = const <Results>[],
    this.message = '',
    this.tvViewState = TvViewStatus.loading,
  });

  TvState copyWith({
    TvViewStatus? tvViewState,
    List<Results>? listResult,
    String? message,
    int? page,
    bool? hasReachedMax,
  }) =>
      TvState(
        tvViewState: tvViewState ?? this.tvViewState,
        listResult: listResult ?? this.listResult,
        message: message ?? this.message,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  List<Object?> get props => [
        tvViewState,
        listResult,
        message,
        page,
        hasReachedMax,
      ];
}
