import 'package:dartz/dartz.dart';
import '../entities/movie.dart';
import 'package:movie/domain/repositories/movie_repository.dart';
import 'package:movie/utils/failure.dart';

class GetMovieRecommendations {
  final MovieRepository repository;

  GetMovieRecommendations(this.repository);

  Future<Either<Failure, List<Movie>>> execute(id) {
    return repository.getMovieRecommendations(id);
  }
}
