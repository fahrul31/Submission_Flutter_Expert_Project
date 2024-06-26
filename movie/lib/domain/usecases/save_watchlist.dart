import 'package:dartz/dartz.dart';
import 'package:movie/utils/failure.dart';
import '../entities/movie_detail.dart';
import 'package:movie/domain/repositories/movie_repository.dart';

class SaveWatchlist {
  final MovieRepository repository;

  SaveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlist(movie);
  }
}
