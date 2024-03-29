part of 'watchlist_movie_bloc.dart';

abstract class WatchlistMovieState extends Equatable {
  const WatchlistMovieState();

  @override
  List<Object> get props => [];
}

final class WatchlistMovieEmpty extends WatchlistMovieState {}

final class WatchlistMovieLoading extends WatchlistMovieState {}

final class WatchlistMovieError extends WatchlistMovieState {
  final String message;

  const WatchlistMovieError(this.message);

  @override
  List<Object> get props => [message];
}

final class WatchlistMovieHasData extends WatchlistMovieState {
  final List<Movie> watchlistMovies;

  const WatchlistMovieHasData(this.watchlistMovies);

  @override
  List<Object> get props => [watchlistMovies];
}
