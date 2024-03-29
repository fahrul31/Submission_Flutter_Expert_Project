part of 'movie_detail_watchlist_bloc.dart';

abstract class MovieDetailWatchlistState extends Equatable {
  const MovieDetailWatchlistState();

  @override
  List<Object> get props => [];
}

class MovieDetailWatchlistEmpty extends MovieDetailWatchlistState {}

class MovieDetailWatchlistLoading extends MovieDetailWatchlistState {}

class MovieDetailWatchlistError extends MovieDetailWatchlistState {
  final String message;

  const MovieDetailWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailWatchlistSaved extends MovieDetailWatchlistState {
  final String? message;

  const MovieDetailWatchlistSaved(this.message);

  @override
  List<Object> get props => [message ?? ""];
}

class MovieDetailWatchlistNotSaved extends MovieDetailWatchlistState {
  final String? message;

  const MovieDetailWatchlistNotSaved(this.message);

  @override
  List<Object> get props => [message ?? ""];
}
