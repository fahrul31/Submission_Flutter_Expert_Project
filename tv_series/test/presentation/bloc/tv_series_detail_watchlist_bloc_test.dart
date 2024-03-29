import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_watchlist_status_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series_detail_watchlist/tv_series_detail_watchlist_bloc.dart';
import 'package:tv_series/utils/failure.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_watchlist_bloc_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatusTvSeries,
  SaveWatchTvSeries,
  RemoveWatchlistTvSeries,
])
void main() {
  late TvSeriesDetailWatchlistBloc tvSeriesDetailWatchlistBloc;
  late MockGetWatchListStatusTvSeries mockGetWatchlistStatusTvSeries;
  late MockSaveWatchTvSeries mockSaveWatchTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
    mockGetWatchlistStatusTvSeries = MockGetWatchListStatusTvSeries();
    mockSaveWatchTvSeries = MockSaveWatchTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    tvSeriesDetailWatchlistBloc = TvSeriesDetailWatchlistBloc(
      getWatchListStatus: mockGetWatchlistStatusTvSeries,
      saveWatchlist: mockSaveWatchTvSeries,
      removeWatchlist: mockRemoveWatchlistTvSeries,
    );
  });

  final tId = 1;

  test('initial state should be empty', () {
    expect(tvSeriesDetailWatchlistBloc.state, TvSeriesDetailWatchlistEmpty());
  });

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, Saved] when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatusTvSeries.execute(tId))
          .thenAnswer((_) async => true);
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetStatusWatchlist(tId)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistSaved("")
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatusTvSeries.execute(tId));
    },
  );

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, NotSaved] when data is on watchlist',
    build: () {
      when(mockGetWatchlistStatusTvSeries.execute(tId))
          .thenAnswer((_) async => false);
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(GetStatusWatchlist(tId)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistNotSaved("")
    ],
    verify: (bloc) {
      verify(mockGetWatchlistStatusTvSeries.execute(tId));
    },
  );

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, Saved] when data is success saved watchlist',
    build: () {
      when(mockSaveWatchTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right("Success"));
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(SaveWatchlistChanged(testTvSeriesDetail)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistSaved("Success")
    ],
    verify: (bloc) {
      verify(mockSaveWatchTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, Error] when data is failed saved watchlist',
    build: () {
      when(mockSaveWatchTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(SaveWatchlistChanged(testTvSeriesDetail)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistError("Failed")
    ],
    verify: (bloc) {
      verify(mockSaveWatchTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, NotSaved] when data is success removed watchlist',
    build: () {
      when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => const Right("Success Removed"));
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(RemoveWatchlistChanged(testTvSeriesDetail)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistNotSaved("Success Removed")
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );

  blocTest<TvSeriesDetailWatchlistBloc, TvSeriesDetailWatchlistState>(
    'Should emit [Loading, "Error"] when data is success removed watchlist',
    build: () {
      when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure("Failed")));
      return tvSeriesDetailWatchlistBloc;
    },
    act: (bloc) => bloc.add(RemoveWatchlistChanged(testTvSeriesDetail)),
    expect: () => <TvSeriesDetailWatchlistState>[
      TvSeriesDetailWatchlistLoading(),
      const TvSeriesDetailWatchlistError("Failed")
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail));
    },
  );
}
