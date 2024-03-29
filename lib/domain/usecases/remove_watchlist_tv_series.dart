import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class RemoveWatchlistTvSeries {
  final TvSeriesRepository _repository;

  RemoveWatchlistTvSeries(this._repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tv) {
    return _repository.removeWatchlist(tv);
  }
}
