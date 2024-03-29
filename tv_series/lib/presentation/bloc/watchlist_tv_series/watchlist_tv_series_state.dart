part of 'watchlist_tv_series_bloc.dart';

abstract class WatchlistTvSeriesState extends Equatable {
  const WatchlistTvSeriesState();

  @override
  List<Object> get props => [];
}

final class WatchlistTvSeriesEmpty extends WatchlistTvSeriesState {}

final class WatchlistTvSeriesLoading extends WatchlistTvSeriesState {}

final class WatchlistTvSeriesError extends WatchlistTvSeriesState {
  final String message;

  const WatchlistTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

final class WatchlistTvSeriesHasData extends WatchlistTvSeriesState {
  final List<TvSeries> watchlistTvSeriess;

  const WatchlistTvSeriesHasData(this.watchlistTvSeriess);

  @override
  List<Object> get props => [watchlistTvSeriess];
}
