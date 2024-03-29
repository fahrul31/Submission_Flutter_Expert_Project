import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/episode.dart';
import 'package:tv_series/domain/entities/season_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_series_season_detail.dart';
import 'package:tv_series/presentation/bloc/tv_series_season_detail/tv_series_season_detail_bloc.dart';
import 'package:tv_series/utils/failure.dart';

import 'tv_series_season_detail_bloc_test.mocks.dart';

@GenerateMocks([GetTvSeriesSeasonDetail])
void main() {
  late TvSeriesDetailSeasonBloc tvSeriesDetailSeasonBloc;
  late MockGetTvSeriesSeasonDetail mockGetTvSeriesSeasonDetail;

  setUp(() {
    mockGetTvSeriesSeasonDetail = MockGetTvSeriesSeasonDetail();
    tvSeriesDetailSeasonBloc = TvSeriesDetailSeasonBloc(
      getTvSeriesSeasonDetail: mockGetTvSeriesSeasonDetail,
    );
  });

  final tSeasonDetail = SeasonDetail(
    id: 85937,
    overview:
        'It is the Taisho Period in Japan. Tanjiro, a kindhearted boy who sells charcoal for a living, finds his family slaughtered by a demon. To make matters worse, his younger sister Nezuko, the sole survivor, has been transformed into a demon herself. Though devastated by this grim reality, Tanjiro resolves to become a “demon slayer” so that he can turn his sister back into a human, and kill the demon that massacred his family.',
    posterPath: '/xUfRZu2mi8jH6SzQEJGP6tjBuYj.jpg',
    name: 'Demon Slayer: Kimetsu no Yaiba',
    voteAverage: 8.674,
    airDate: '2019-04-06',
    episodes: [
      Episode(
        airDate: '2019-04-06',
        episodeNumber: 1,
        id: 1,
        name: "Cruelty",
        overview: "overview",
        stillPath: "stillPath.jpg",
        voteAverage: 1,
      )
    ],
    seasonNumber: 1,
  );
  const tId = 85937;
  const tSeasonNumber = 1;
  final tSeasonDetailList = tSeasonDetail;

  test('initial state should be empty', () {
    expect(tvSeriesDetailSeasonBloc.state, TvSeriesDetailSeasonEmpty());
  });

  blocTest<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTvSeriesSeasonDetail.execute(tId, tSeasonNumber))
          .thenAnswer((_) async => Right(tSeasonDetailList));
      return tvSeriesDetailSeasonBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeriesDetailSeason(tId, tSeasonNumber)),
    expect: () => <TvSeriesDetailSeasonState>[
      TvSeriesDetailSeasonLoading(),
      TvSeriesDetailSeasonHasData(tSeasonDetailList)
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesSeasonDetail.execute(tId, tSeasonNumber));
    },
  );

  blocTest<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
    'Should emit [Loading, Error] when get all list TvSeries is unsuccessful',
    build: () {
      when(mockGetTvSeriesSeasonDetail.execute(tId, tSeasonNumber))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesDetailSeasonBloc;
    },
    act: (bloc) => bloc.add(FetchTvSeriesDetailSeason(tId, tSeasonNumber)),
    expect: () => [
      TvSeriesDetailSeasonLoading(),
      const TvSeriesDetailSeasonError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesSeasonDetail.execute(tId, tSeasonNumber));
    },
  );
}
