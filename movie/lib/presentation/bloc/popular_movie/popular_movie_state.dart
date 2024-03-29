part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();

  @override
  List<Object> get props => [];
}

final class PopularMovieEmpty extends PopularMovieState {}

final class PopularMovieLoading extends PopularMovieState {}

final class PopularMovieError extends PopularMovieState {
  final String message;

  const PopularMovieError(this.message);

  @override
  List<Object> get props => [message];
}

final class PopularMovieHasData extends PopularMovieState {
  final List<Movie> popularMovies;

  const PopularMovieHasData(this.popularMovies);

  @override
  List<Object> get props => [popularMovies];
}
