import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendations.dart';

part 'tv_series_detail_event.dart';
part 'tv_series_detail_state.dart';

class TvSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TvSeriesDetailState> {
  final GetTvSeriesDetail _getTvSeriesDetail;
  final GetTvSeriesRecommendations _getTvSeriesRecommendations;
  TvSeriesDetailBloc({
    required GetTvSeriesDetail getTvSeriesDetail,
    required GetTvSeriesRecommendations getTvSeriesRecommendations,
  })  : _getTvSeriesDetail = getTvSeriesDetail,
        _getTvSeriesRecommendations = getTvSeriesRecommendations,
        super(TvSeriesDetailEmpty()) {
    on<FetchTvSeriesDetail>((event, emit) async {
      final id = event.id;
      emit(TvSeriesDetailLoading());
      final result = await _getTvSeriesDetail.execute(id);
      final resultRecommendation =
          await _getTvSeriesRecommendations.execute(id);
      result.fold(
        (failure) {
          emit(TvSeriesDetailError(failure.message));
        },
        (data) {
          resultRecommendation.fold(
            (failure) {
              emit(TvSeriesDetailError(failure.message));
            },
            (dataRecommendation) {
              emit(TvSeriesDetailHasData(data, dataRecommendation));
            },
          );
        },
      );
    });
  }
}
