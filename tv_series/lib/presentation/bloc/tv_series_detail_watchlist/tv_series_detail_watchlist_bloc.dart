import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';
import 'package:tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';

part 'tv_series_detail_watchlist_event.dart';
part 'tv_series_detail_watchlist_state.dart';

class TvSeriesDetailWatchlistBloc
    extends Bloc<TvSeriesDetailWatchlistEvent, TvSeriesDetailWatchlistState> {
  final GetWatchListStatusTvSeries _getWatchListStatus;
  final SaveWatchTvSeries _saveWatchlist;
  final RemoveWatchlistTvSeries _removeWatchlist;

  TvSeriesDetailWatchlistBloc({
    required GetWatchListStatusTvSeries getWatchListStatus,
    required SaveWatchTvSeries saveWatchlist,
    required RemoveWatchlistTvSeries removeWatchlist,
  })  : _getWatchListStatus = getWatchListStatus,
        _saveWatchlist = saveWatchlist,
        _removeWatchlist = removeWatchlist,
        super(TvSeriesDetailWatchlistEmpty()) {
    on<SaveWatchlistChanged>(
      (event, emit) async {
        final tvSeries = event.tvSeries;

        emit(TvSeriesDetailWatchlistLoading());
        final result = await _saveWatchlist.execute(tvSeries);
        result.fold(
          (failure) {
            emit(TvSeriesDetailWatchlistError(failure.message));
          },
          (data) {
            emit(TvSeriesDetailWatchlistSaved(data));
          },
        );
      },
    );
    on<RemoveWatchlistChanged>(
      (event, emit) async {
        final tvSeries = event.tvSeries;

        emit(TvSeriesDetailWatchlistLoading());
        final result = await _removeWatchlist.execute(tvSeries);
        result.fold(
          (failure) {
            emit(TvSeriesDetailWatchlistError(failure.message));
          },
          (data) {
            emit(TvSeriesDetailWatchlistNotSaved(data));
          },
        );
      },
    );
    on<GetStatusWatchlist>(
      (event, emit) async {
        final id = event.id;

        emit(TvSeriesDetailWatchlistLoading());
        final result = await _getWatchListStatus.execute(id);
        result
            ? emit(const TvSeriesDetailWatchlistSaved(""))
            : emit(const TvSeriesDetailWatchlistNotSaved(""));
      },
    );
  }
}
