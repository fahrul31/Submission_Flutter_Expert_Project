import 'package:dartz/dartz.dart';
import 'package:movie/utils/failure.dart';
import '../entities/movie.dart';
import 'package:movie/domain/repositories/movie_repository.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getTopRatedMovies();
  }
}
