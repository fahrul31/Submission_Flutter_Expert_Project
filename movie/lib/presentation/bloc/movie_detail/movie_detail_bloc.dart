import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/entities/movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_movie_recommendations.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  MovieDetailBloc({
    required GetMovieDetail getMovieDetail,
    required GetMovieRecommendations getMovieRecommendations,
  })  : _getMovieDetail = getMovieDetail,
        _getMovieRecommendations = getMovieRecommendations,
        super(MovieDetailEmpty()) {
    on<FetchMovieDetail>((event, emit) async {
      final id = event.id;
      emit(MovieDetailLoading());
      final result = await _getMovieDetail.execute(id);
      final resultRecommendation = await _getMovieRecommendations.execute(id);
      result.fold(
        (failure) {
          emit(MovieDetailError(failure.message));
        },
        (data) {
          resultRecommendation.fold(
            (failure) {
              emit(MovieDetailError(failure.message));
            },
            (dataRecommendation) {
              emit(MovieDetailHasData(data, dataRecommendation));
            },
          );
        },
      );
    });
  }
}
