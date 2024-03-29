part of 'tv_series_detail_watchlist_bloc.dart';

abstract class TvSeriesDetailWatchlistEvent extends Equatable {
  const TvSeriesDetailWatchlistEvent();

  @override
  List<Object> get props => [];
}

class SaveWatchlistChanged extends TvSeriesDetailWatchlistEvent {
  final TvSeriesDetail tvSeries;

  const SaveWatchlistChanged(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}

class RemoveWatchlistChanged extends TvSeriesDetailWatchlistEvent {
  final TvSeriesDetail tvSeries;

  const RemoveWatchlistChanged(this.tvSeries);

  @override
  List<Object> get props => [tvSeries];
}

class GetStatusWatchlist extends TvSeriesDetailWatchlistEvent {
  final int id;

  const GetStatusWatchlist(this.id);

  @override
  List<Object> get props => [id];
}
