import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/season_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_series_season_detail.dart';

part 'tv_series_season_detail_event.dart';
part 'tv_series_season_detail_state.dart';

class TvSeriesDetailSeasonBloc
    extends Bloc<TvSeriesDetailSeasonEvent, TvSeriesDetailSeasonState> {
  final GetTvSeriesSeasonDetail _getTvSeriesSeasonDetail;

  TvSeriesDetailSeasonBloc({
    required GetTvSeriesSeasonDetail getTvSeriesSeasonDetail,
  })  : _getTvSeriesSeasonDetail = getTvSeriesSeasonDetail,
        super(TvSeriesDetailSeasonEmpty()) {
    on<FetchTvSeriesDetailSeason>(
      (event, emit) async {
        final id = event.id;
        final seasonNumber = event.seasonNumber;

        emit(TvSeriesDetailSeasonLoading());
        final result = await _getTvSeriesSeasonDetail.execute(id, seasonNumber);

        result.fold(
          (failure) {
            emit(TvSeriesDetailSeasonError(failure.message));
          },
          (data) {
            emit(TvSeriesDetailSeasonHasData(data));
          },
        );
      },
    );
  }
}
