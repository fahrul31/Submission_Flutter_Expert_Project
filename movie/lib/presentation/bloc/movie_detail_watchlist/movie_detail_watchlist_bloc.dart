import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie_detail.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';

part 'movie_detail_watchlist_event.dart';
part 'movie_detail_watchlist_state.dart';

class MovieDetailWatchlistBloc
    extends Bloc<MovieDetailWatchlistEvent, MovieDetailWatchlistState> {
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlist _saveWatchlist;
  final RemoveWatchlist _removeWatchlist;

  MovieDetailWatchlistBloc({
    required GetWatchListStatus getWatchListStatus,
    required SaveWatchlist saveWatchlist,
    required RemoveWatchlist removeWatchlist,
  })  : _getWatchListStatus = getWatchListStatus,
        _saveWatchlist = saveWatchlist,
        _removeWatchlist = removeWatchlist,
        super(MovieDetailWatchlistEmpty()) {
    on<SaveWatchlistChanged>(
      (event, emit) async {
        final movie = event.movie;

        emit(MovieDetailWatchlistLoading());
        final result = await _saveWatchlist.execute(movie);
        result.fold(
          (failure) {
            emit(MovieDetailWatchlistError(failure.message));
          },
          (data) {
            emit(MovieDetailWatchlistSaved(data));
          },
        );
      },
    );
    on<RemoveWatchlistChanged>(
      (event, emit) async {
        final movie = event.movie;

        emit(MovieDetailWatchlistLoading());
        final result = await _removeWatchlist.execute(movie);
        result.fold(
          (failure) {
            emit(MovieDetailWatchlistError(failure.message));
          },
          (data) {
            emit(MovieDetailWatchlistNotSaved(data));
          },
        );
      },
    );
    on<GetStatusWatchlist>(
      (event, emit) async {
        final id = event.id;

        emit(MovieDetailWatchlistLoading());
        final result = await _getWatchListStatus.execute(id);
        result
            ? emit(const MovieDetailWatchlistSaved(""))
            : emit(const MovieDetailWatchlistNotSaved(""));
      },
    );
  }
}
