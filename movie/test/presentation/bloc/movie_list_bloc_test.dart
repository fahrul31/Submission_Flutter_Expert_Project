import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movie/domain/usecases/get_popular_movies.dart';
import 'package:movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movie/presentation/bloc/movie_list/movie_list_bloc.dart';
import 'package:movie/utils/failure.dart';

import 'movie_list_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies, GetPopularMovies, GetTopRatedMovies])
void main() {
  late MovieListBloc movieListbloc;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    movieListbloc = MovieListBloc(
      getNowPlayingMovies: mockGetNowPlayingMovies,
      getPopularMovies: mockGetPopularMovies,
      getTopRatedMovies: mockGetTopRatedMovies,
    );
  });

  final tMovie = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovieList = <Movie>[tMovie];

  test('initial state should be empty', () {
    expect(movieListbloc.state, MovieListEmpty());
  });

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return movieListbloc;
    },
    act: (bloc) => bloc.add(FetchMovie()),
    expect: () => <MovieListState>[
      MovieListLoading(),
      MovieListHasData(tMovieList, tMovieList, tMovieList)
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetPopularMovies.execute());
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when get all list Movie is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieListbloc;
    },
    act: (bloc) => bloc.add(FetchMovie()),
    expect: () => [
      MovieListLoading(),
      const MovieListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetPopularMovies.execute());
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when get all list Popular and Top Rated Movie is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieListbloc;
    },
    act: (bloc) => bloc.add(FetchMovie()),
    expect: () => [
      MovieListLoading(),
      const MovieListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetPopularMovies.execute());
      verify(mockGetTopRatedMovies.execute());
    },
  );

  blocTest<MovieListBloc, MovieListState>(
    'Should emit [Loading, Error] when get all list Popular and Top Rated Movie is unsuccessful',
    build: () {
      when(mockGetNowPlayingMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      when(mockGetPopularMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      when(mockGetTopRatedMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieListbloc;
    },
    act: (bloc) => bloc.add(FetchMovie()),
    expect: () => [
      MovieListLoading(),
      const MovieListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingMovies.execute());
      verify(mockGetPopularMovies.execute());
      verify(mockGetTopRatedMovies.execute());
    },
  );
}
