part of 'tv_series_season_detail_bloc.dart';

abstract class TvSeriesDetailSeasonState extends Equatable {
  const TvSeriesDetailSeasonState();

  @override
  List<Object> get props => [];
}

final class TvSeriesDetailSeasonEmpty extends TvSeriesDetailSeasonState {}

final class TvSeriesDetailSeasonLoading extends TvSeriesDetailSeasonState {}

final class TvSeriesDetailSeasonError extends TvSeriesDetailSeasonState {
  final String message;

  const TvSeriesDetailSeasonError(this.message);

  @override
  List<Object> get props => [message];
}

final class TvSeriesDetailSeasonHasData extends TvSeriesDetailSeasonState {
  final SeasonDetail tvSeriesDetailSeason;

  const TvSeriesDetailSeasonHasData(this.tvSeriesDetailSeason);

  @override
  List<Object> get props => [tvSeriesDetailSeason];
}
