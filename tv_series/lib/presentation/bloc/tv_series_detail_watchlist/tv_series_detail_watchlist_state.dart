part of 'tv_series_detail_watchlist_bloc.dart';

abstract class TvSeriesDetailWatchlistState extends Equatable {
  const TvSeriesDetailWatchlistState();

  @override
  List<Object> get props => [];
}

class TvSeriesDetailWatchlistEmpty extends TvSeriesDetailWatchlistState {}

class TvSeriesDetailWatchlistLoading extends TvSeriesDetailWatchlistState {}

class TvSeriesDetailWatchlistError extends TvSeriesDetailWatchlistState {
  final String message;

  const TvSeriesDetailWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesDetailWatchlistSaved extends TvSeriesDetailWatchlistState {
  final String? message;

  const TvSeriesDetailWatchlistSaved(this.message);

  @override
  List<Object> get props => [message ?? ""];
}

class TvSeriesDetailWatchlistNotSaved extends TvSeriesDetailWatchlistState {
  final String? message;

  const TvSeriesDetailWatchlistNotSaved(this.message);

  @override
  List<Object> get props => [message ?? ""];
}
