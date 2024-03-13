import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/season_detail.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetTvSeriesSeasonDetail {
  final TvSeriesRepository repository;

  GetTvSeriesSeasonDetail(this.repository);

  Future<Either<Failure, SeasonDetail>> execute(int id, int seasonNumber) {
    return repository.getTvSeriesSeasonDetail(id, seasonNumber);
  }
}
