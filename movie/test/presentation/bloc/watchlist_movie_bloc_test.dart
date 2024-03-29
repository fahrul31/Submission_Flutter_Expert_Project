import 'package:dartz/dartz.dart';
import 'package:movie/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:movie/utils/failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:movie/domain/usecases/get_watchlist_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movie_bloc_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late WatchlistMovieBloc watchlistMoviebloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    watchlistMoviebloc = WatchlistMovieBloc(
      getWatchlistMovies: mockGetWatchlistMovies,
    );
  });

  test('initial state should be empty', () {
    expect(watchlistMoviebloc.state, WatchlistMovieEmpty());
  });

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right([testWatchlistMovie]));
      return watchlistMoviebloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMovie()),
    expect: () => <WatchlistMovieState>[
      WatchlistMovieLoading(),
      WatchlistMovieHasData([testWatchlistMovie])
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );

  blocTest<WatchlistMovieBloc, WatchlistMovieState>(
    'Should emit [Loading, Error] when get all list Movie is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Left(ServerFailure("Can't get data")));
      return watchlistMoviebloc;
    },
    act: (bloc) => bloc.add(FetchWatchlistMovie()),
    expect: () => [
      WatchlistMovieLoading(),
      const WatchlistMovieError("Can't get data"),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );
}
