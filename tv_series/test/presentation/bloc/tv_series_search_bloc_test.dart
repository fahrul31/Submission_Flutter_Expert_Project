import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/search_tv_series.dart';
import 'package:tv_series/presentation/bloc/tv_series_search/tv_series_search_bloc.dart';
import 'package:tv_series/utils/failure.dart';

import 'tv_series_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late TvSeriesSearchBloc tvSeriesSearchBloc;
  late MockSearchTvSeries mockSearchTvSeriess;

  setUp(() {
    mockSearchTvSeriess = MockSearchTvSeries();
    tvSeriesSearchBloc =
        TvSeriesSearchBloc(searchTvSeries: mockSearchTvSeriess);
  });

  test('initial state should be empty', () {
    expect(tvSeriesSearchBloc.state, TvSeriesSearchEmpty());
  });

  final tTvSeriesModel = TvSeries(
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
  final tTvSeriesList = <TvSeries>[tTvSeriesModel];
  const tQuery = 'demon slayer';

  blocTest<TvSeriesSearchBloc, TvSeriesSearchState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvSeriess.execute(tQuery))
          .thenAnswer((_) async => Right(tTvSeriesList));
      return tvSeriesSearchBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSeriesSearchLoading(),
      TvSeriesSearchHasData(tTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeriess.execute(tQuery));
    },
  );

  blocTest<TvSeriesSearchBloc, TvSeriesSearchState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvSeriess.execute(tQuery))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesSearchBloc;
    },
    act: (bloc) => bloc.add(OnQueryChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSeriesSearchLoading(),
      TvSeriesSearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeriess.execute(tQuery));
    },
  );
}
