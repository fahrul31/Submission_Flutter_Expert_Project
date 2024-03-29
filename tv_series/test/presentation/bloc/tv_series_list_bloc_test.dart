import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_now_playing_tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series_list/tv_series_list_bloc.dart';
import 'package:tv_series/utils/failure.dart';

import 'tv_series_list_bloc_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeries, GetPopularTvSeries, GetTopRatedTvSeries])
void main() {
  late TvSeriesListBloc tvSeriesListBloc;
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late MockGetPopularTvSeries mockGetPopularTvSeries;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    tvSeriesListBloc = TvSeriesListBloc(
      getNowPlayingTvSeries: mockGetNowPlayingTvSeries,
      getPopularTvSeries: mockGetPopularTvSeries,
      getTopRatedTvSeries: mockGetTopRatedTvSeries,
    );
  });

  final tTvSeries = TvSeries(
    adult: false,
    backdropPath: '/nTvM4mhqNlHIvUkI1gVnW6XP7GG.jpg',
    genreIds: const [16, 10759, 10765],
    id: 85937,
    originalLanguage: "JP",
    originalName: '鬼滅の刃',
    overview:
        'It is the Taisho Period in Japan. Tanjiro, a kindhearted boy who sells charcoal for a living, finds his family slaughtered by a demon. To make matters worse, his younger sister Nezuko, the sole survivor, has been transformed into a demon herself. Though devastated by this grim reality, Tanjiro resolves to become a “demon slayer” so that he can turn his sister back into a human, and kill the demon that massacred his family.',
    popularity: 146.471,
    posterPath: '/xUfRZu2mi8jH6SzQEJGP6tjBuYj.jpg',
    firstAirDate: '2019-04-06',
    name: 'Demon Slayer: Kimetsu no Yaiba',
    voteAverage: 8.674,
    voteCount: 5926,
  );
  final tTvSeriesList = <TvSeries>[tTvSeries];

  test('initial state should be empty', () {
    expect(tvSeriesListBloc.state, TvSeriesListEmpty());
  });

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeries()),
    expect: () => <TvSeriesListState>[
      TvSeriesListLoading(),
      TvSeriesListHasData(tTvSeriesList, tTvSeriesList, tTvSeriesList)
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when get all list TvSeries is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      const TvSeriesListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when get all list Popular and Top Rated TvSeries is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      const TvSeriesListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
    },
  );

  blocTest<TvSeriesListBloc, TvSeriesListState>(
    'Should emit [Loading, Error] when get all list Popular and Top Rated TvSeries is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      when(mockGetTopRatedTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvSeriesListBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeries()),
    expect: () => [
      TvSeriesListLoading(),
      const TvSeriesListError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
      verify(mockGetPopularTvSeries.execute());
      verify(mockGetTopRatedTvSeries.execute());
    },
  );
}
