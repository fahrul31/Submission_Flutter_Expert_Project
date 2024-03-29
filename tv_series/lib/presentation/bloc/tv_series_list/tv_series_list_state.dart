part of 'tv_series_list_bloc.dart';

abstract class TvSeriesListState extends Equatable {
  const TvSeriesListState();

  @override
  List<Object> get props => [];
}

final class TvSeriesListEmpty extends TvSeriesListState {}

final class TvSeriesListLoading extends TvSeriesListState {}

final class TvSeriesListError extends TvSeriesListState {
  final String message;

  const TvSeriesListError(this.message);

  @override
  List<Object> get props => [message];
}

final class TvSeriesListHasData extends TvSeriesListState {
  final List<TvSeries> nowPlayingTvSeries;
  final List<TvSeries> popularTvSeries;
  final List<TvSeries> topRatedTvSeries;

  const TvSeriesListHasData(
    this.nowPlayingTvSeries,
    this.popularTvSeries,
    this.topRatedTvSeries,
  );

  @override
  List<Object> get props => [
        nowPlayingTvSeries,
        popularTvSeries,
        topRatedTvSeries,
      ];
}
