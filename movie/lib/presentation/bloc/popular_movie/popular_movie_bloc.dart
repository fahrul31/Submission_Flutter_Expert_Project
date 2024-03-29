import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies _getPopularMovies;

  PopularMovieBloc({
    required GetPopularMovies getPopularMovies,
  })  : _getPopularMovies = getPopularMovies,
        super(PopularMovieEmpty()) {
    on<FetchPopularMovie>(
      (event, emit) async {
        emit(PopularMovieLoading());
        final result = await _getPopularMovies.execute();

        result.fold(
          (failure) {
            emit(PopularMovieError(failure.message));
          },
          (data) {
            emit(PopularMovieHasData(data));
          },
        );
      },
    );
  }
}
