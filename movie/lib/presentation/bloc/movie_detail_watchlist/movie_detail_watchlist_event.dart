part of 'movie_detail_watchlist_bloc.dart';

abstract class MovieDetailWatchlistEvent extends Equatable {
  const MovieDetailWatchlistEvent();

  @override
  List<Object> get props => [];
}

class SaveWatchlistChanged extends MovieDetailWatchlistEvent {
  final MovieDetail movie;

  const SaveWatchlistChanged(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveWatchlistChanged extends MovieDetailWatchlistEvent {
  final MovieDetail movie;

  const RemoveWatchlistChanged(this.movie);

  @override
  List<Object> get props => [movie];
}

class GetStatusWatchlist extends MovieDetailWatchlistEvent {
  final int id;

  const GetStatusWatchlist(this.id);

  @override
  List<Object> get props => [id];
}
