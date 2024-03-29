import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movie_event.dart';
part 'top_rated_movie_state.dart';

class TopRatedMovieBloc extends Bloc<TopRatedMovieEvent, TopRatedMovieState> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMovieBloc({
    required GetTopRatedMovies getTopRatedMovies,
  })  : _getTopRatedMovies = getTopRatedMovies,
        super(TopRatedMovieEmpty()) {
    on<FetchTopRatedMovie>(
      (event, emit) async {
        emit(TopRatedMovieLoading());
        final result = await _getTopRatedMovies.execute();

        result.fold(
          (failure) {
            emit(TopRatedMovieError(failure.message));
          },
          (data) {
            emit(TopRatedMovieHasData(data));
          },
        );
      },
    );
  }
}
