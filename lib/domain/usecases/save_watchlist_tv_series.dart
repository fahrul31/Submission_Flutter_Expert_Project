import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class SaveWatchTvSeries {
  final TvSeriesRepository _repository;

  SaveWatchTvSeries(this._repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tv) {
    return _repository.saveWatchlist(tv);
  }
}
