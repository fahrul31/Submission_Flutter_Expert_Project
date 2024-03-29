import 'package:dartz/dartz.dart';
import '../entities/movie.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:movie/utils/failure.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
