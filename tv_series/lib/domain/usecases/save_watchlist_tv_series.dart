import 'package:dartz/dartz.dart';
import 'package:tv_series/utils/failure.dart';
import '../entities/tv_series_detail.dart';
import '../repositories/tv_series_repository.dart';

class SaveWatchTvSeries {
  final TvSeriesRepository _repository;

  SaveWatchTvSeries(this._repository);

  Future<Either<Failure, String>> execute(TvSeriesDetail tv) {
    return _repository.saveWatchlist(tv);
  }
}
