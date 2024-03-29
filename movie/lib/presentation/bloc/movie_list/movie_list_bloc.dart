import 'package:movie/domain/entities/movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetNowPlayingMovies _getNowPlayingMovies;
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;

  MovieListBloc({
    required GetNowPlayingMovies getNowPlayingMovies,
    required GetPopularMovies getPopularMovies,
    required GetTopRatedMovies getTopRatedMovies,
  })  : _getNowPlayingMovies = getNowPlayingMovies,
        _getPopularMovies = getPopularMovies,
        _getTopRatedMovies = getTopRatedMovies,
        super(MovieListEmpty()) {
    on<FetchMovie>(
      (event, emit) async {
        emit(MovieListLoading());
        final resultNowPlayingMovies = await _getNowPlayingMovies.execute();
        final resultPopularMovies = await _getPopularMovies.execute();
        final resultTopRatedMovies = await _getTopRatedMovies.execute();

        resultNowPlayingMovies.fold(
          (failure) {
            emit(MovieListError(failure.message));
          },
          (dataNowPlaying) {
            resultPopularMovies.fold(
              (failure) {
                emit(MovieListError(failure.message));
              },
              (dataPopularMovies) {
                resultTopRatedMovies.fold(
                  (failure) {
                    emit(MovieListError(failure.message));
                  },
                  (dataTopRatedMovies) {
                    emit(
                      MovieListHasData(
                        dataNowPlaying,
                        dataPopularMovies,
                        dataTopRatedMovies,
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
