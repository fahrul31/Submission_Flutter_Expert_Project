part of 'top_rated_movie_bloc.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object> get props => [];
}

final class TopRatedMovieEmpty extends TopRatedMovieState {}

final class TopRatedMovieLoading extends TopRatedMovieState {}

final class TopRatedMovieError extends TopRatedMovieState {
  final String message;

  const TopRatedMovieError(this.message);

  @override
  List<Object> get props => [message];
}

final class TopRatedMovieHasData extends TopRatedMovieState {
  final List<Movie> topRatedMovies;

  const TopRatedMovieHasData(this.topRatedMovies);

  @override
  List<Object> get props => [topRatedMovies];
}
