part of 'tv_series_season_detail_bloc.dart';

abstract class TvSeriesDetailSeasonEvent extends Equatable {
  const TvSeriesDetailSeasonEvent();

  @override
  List<Object> get props => [];
}

class FetchTvSeriesDetailSeason extends TvSeriesDetailSeasonEvent {
  final int id;
  final int seasonNumber;

  FetchTvSeriesDetailSeason(this.id, this.seasonNumber);

  @override
  List<Object> get props => [id, seasonNumber];
}
