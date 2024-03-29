part of 'tv_series_list_bloc.dart';

abstract class TvSeriesListEvent extends Equatable {
  const TvSeriesListEvent();

  @override
  List<Object> get props => [];
}

class FetchTvSeries extends TvSeriesListEvent {}
