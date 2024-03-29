import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';

part 'tv_series_list_event.dart';
part 'tv_series_list_state.dart';

class TvSeriesListBloc extends Bloc<TvSeriesListEvent, TvSeriesListState> {
  final GetNowPlayingTvSeries _getNowPlayingTvSeries;
  final GetPopularTvSeries _getPopularTvSeries;
  final GetTopRatedTvSeries _getTopRatedTvSeries;

  TvSeriesListBloc({
    required GetNowPlayingTvSeries getNowPlayingTvSeries,
    required GetPopularTvSeries getPopularTvSeries,
    required GetTopRatedTvSeries getTopRatedTvSeries,
  })  : _getNowPlayingTvSeries = getNowPlayingTvSeries,
        _getPopularTvSeries = getPopularTvSeries,
        _getTopRatedTvSeries = getTopRatedTvSeries,
        super(TvSeriesListEmpty()) {
    on<FetchTvSeries>(
      (event, emit) async {
        emit(TvSeriesListLoading());
        final resultNowPlayingTvSeries = await _getNowPlayingTvSeries.execute();
        final resultPopularTvSeries = await _getPopularTvSeries.execute();
        final resultTopRatedTvSeries = await _getTopRatedTvSeries.execute();

        resultNowPlayingTvSeries.fold(
          (failure) {
            emit(TvSeriesListError(failure.message));
          },
          (dataNowPlaying) {
            resultPopularTvSeries.fold(
              (failure) {
                emit(TvSeriesListError(failure.message));
              },
              (dataPopularTvSeries) {
                resultTopRatedTvSeries.fold(
                  (failure) {
                    emit(TvSeriesListError(failure.message));
                  },
                  (dataTopRatedTvSeries) {
                    emit(
                      TvSeriesListHasData(
                        dataNowPlaying,
                        dataPopularTvSeries,
                        dataTopRatedTvSeries,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
