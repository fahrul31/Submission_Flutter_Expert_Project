import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';

part 'tv_series_search_event.dart';
part 'tv_series_search_state.dart';

class TvSeriesSearchBloc
    extends Bloc<TvSeriesSearchEvent, TvSeriesSearchState> {
  final SearchTvSeries _searchTvSeries;

  TvSeriesSearchBloc({required SearchTvSeries searchTvSeries})
      : _searchTvSeries = searchTvSeries,
        super(TvSeriesSearchEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(TvSeriesSearchLoading());
      final result = await _searchTvSeries.execute(query);
      result.fold(
        (failure) {
          emit(TvSeriesSearchError(failure.message));
        },
        (data) {
          emit(TvSeriesSearchHasData(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
