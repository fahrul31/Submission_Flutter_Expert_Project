import 'package:dartz/dartz.dart';
import 'package:tv_series/utils/failure.dart';
import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository _repository;

  RemoveWatchlistTvSeries(this._repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tv) {
    return _repository.removeWatchlist(tv);
  }
}
