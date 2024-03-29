part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

final class MovieListEmpty extends MovieListState {}

final class MovieListLoading extends MovieListState {}

final class MovieListError extends MovieListState {
  final String message;

  const MovieListError(this.message);

  @override
  List<Object> get props => [message];
}

final class MovieListHasData extends MovieListState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;

  const MovieListHasData(
    this.nowPlayingMovies,
    this.popularMovies,
    this.topRatedMovies,
  );

  @override
  List<Object> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
      ];
}
