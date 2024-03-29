import 'package:dartz/dartz.dart';
import 'package:tv_series/utils/failure.dart';
import '../entities/season_detail.dart';
import '../repositories/tv_series_repository.dart';

class GetTvSeriesSeasonDetail {
  final TvSeriesRepository repository;

  GetTvSeriesSeasonDetail(this.repository);

  Future<Either<Failure, SeasonDetail>> execute(int id, int seasonNumber) {
    return repository.getTvSeriesSeasonDetail(id, seasonNumber);
  }
}
