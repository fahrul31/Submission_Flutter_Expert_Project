import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/domain/usecases/get_watchlist_status.dart';
import 'package:movie/domain/usecases/remove_watchlist.dart';
import 'package:movie/domain/usecases/save_watchlist.dart';
import 'package:movie/presentation/bloc/movie_detail_watchlist/movie_detail_watchlist_bloc.dart';
import 'package:movie/utils/failure.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieDetailWatchlistBloc movieDetailWatchlistBloc;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieDetailWatchlistBloc = MovieDetailWatchlistBloc(
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  const tId = 1;

  test('initial state should be empty', () {
    expect(movieDetailWatchlistBloc.state, MovieDetailWatchlistEmpty());
  });

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, Saved] when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(tId)).thenAnswer((_) async => true);
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const GetStatusWatchlist(tId)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistSaved("")
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(tId));
    },
  );

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, NotSaved] when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatus.execute(tId)).thenAnswer((_) async => false);
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const GetStatusWatchlist(tId)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistNotSaved("")
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatus.execute(tId));
    },
  );

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, Saved] when data is success saved watchlist',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right("Success"));
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const SaveWatchlistChanged(testMovieDetail)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistSaved("Success")
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, Error] when data is failed saved watchlist',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const SaveWatchlistChanged(testMovieDetail)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistError("Failed")
    ],
    verify: (bloc) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, NotSaved] when data is success removed watchlist',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right("Success Removed"));
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const RemoveWatchlistChanged(testMovieDetail)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistNotSaved("Success Removed")
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
    },
  );

  blocTest<MovieDetailWatchlistBloc, MovieDetailWatchlistState>(
    'Should emit [Loading, "Error"] when data is success removed watchlist',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Left(DatabaseFailure("Failed")));
      return movieDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(const RemoveWatchlistChanged(testMovieDetail)),
    expect: () => <MovieDetailWatchlistState>[
      MovieDetailWatchlistLoading(),
      const MovieDetailWatchlistError("Failed")
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
    },
  );
}
