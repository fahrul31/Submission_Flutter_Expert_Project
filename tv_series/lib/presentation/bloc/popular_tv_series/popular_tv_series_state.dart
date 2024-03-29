part of 'popular_tv_series_bloc.dart';

abstract class PopularTvSeriesState extends Equatable {
  const PopularTvSeriesState();

  @override
  List<Object> get props => [];
}

final class PopularTvSeriesEmpty extends PopularTvSeriesState {}

final class PopularTvSeriesLoading extends PopularTvSeriesState {}

final class PopularTvSeriesError extends PopularTvSeriesState {
  final String message;

  const PopularTvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

final class PopularTvSeriesHasData extends PopularTvSeriesState {
  final List<TvSeries> popularTvSeries;

  const PopularTvSeriesHasData(this.popularTvSeries);

  @override
  List<Object> get props => [popularTvSeries];
}
