import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';

part 'watchlist_movie_event.dart';
part 'watchlist_movie_state.dart';

class WatchlistMovieBloc
    extends Bloc<WatchlistMovieEvent, WatchlistMovieState> {
  final GetWatchlistMovies _getWatchlistMovies;

  WatchlistMovieBloc({
    required GetWatchlistMovies getWatchlistMovies,
  })  : _getWatchlistMovies = getWatchlistMovies,
        super(WatchlistMovieEmpty()) {
    on<FetchWatchlistMovie>(
      (event, emit) async {
        emit(WatchlistMovieLoading());
        final result = await _getWatchlistMovies.execute();

        result.fold(
          (failure) {
            emit(WatchlistMovieError(failure.message));
          },
          (data) {
            emit(WatchlistMovieHasData(data));
          },
        );
      },
    );
  }
}
