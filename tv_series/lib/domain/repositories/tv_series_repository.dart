import 'package:dartz/dartz.dart';
import 'package:tv_series/utils/failure.dart';
import '../entities/season_detail.dart';
import '../entities/tv_series.dart';
import '../entities/tv_series_detail.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<TvSeries>>> getNowPlayingTvSeries();
  Future<Either<Failure, List<TvSeries>>> getPopularTvSeries();
  Future<Either<Failure, List<TvSeries>>> getTopRatedTvSeries();
  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(int id);
  Future<Either<Failure, List<TvSeries>>> getTvSeriesRecommendations(int id);
  Future<Either<Failure, List<TvSeries>>> searchTvSeries(String query);
  Future<Either<Failure, SeasonDetail>> getTvSeriesSeasonDetail(
      int id, int seasonNumber);
  Future<Either<Failure, String>> saveWatchlist(TvSeriesDetail tv);
  Future<Either<Failure, String>> removeWatchlist(TvSeriesDetail tv);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, List<TvSeries>>> getWatchlistTvSeries();
}
