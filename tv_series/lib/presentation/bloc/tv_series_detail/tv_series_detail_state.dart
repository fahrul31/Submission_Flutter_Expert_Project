part of 'tv_series_detail_bloc.dart';

abstract class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object> get props => [];
}

final class TvSeriesDetailEmpty extends TvSeriesDetailState {}

final class TvSeriesDetailLoading extends TvSeriesDetailState {}

final class TvSeriesDetailError extends TvSeriesDetailState {
  final String message;

  const TvSeriesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

final class TvSeriesDetailHasData extends TvSeriesDetailState {
  final TvSeriesDetail tvSeriesDetail;
  final List<TvSeries> tvSeriesRecommendations;

  const TvSeriesDetailHasData(
      this.tvSeriesDetail, this.tvSeriesRecommendations);

  @override
  List<Object> get props => [
        tvSeriesDetail,
        tvSeriesRecommendations,
      ];
}
