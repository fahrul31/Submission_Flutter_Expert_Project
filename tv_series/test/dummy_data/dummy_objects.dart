import 'package:tv_series/data/models/tv_series_table.dart';
import 'package:tv_series/domain/entities/episode.dart';
import 'package:tv_series/domain/entities/genre.dart';
import 'package:tv_series/domain/entities/season.dart';
import 'package:tv_series/domain/entities/season_detail.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';

const testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  firstAirDate: '2020-02-02',
  genres: [Genre(id: 1, name: 'Action')],
  homepage: 'https://google.com',
  id: 1,
  languages: ['en'],
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originalLanguage: 'originalLanguage',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  seasons: [
    Season(
        airDate: '2020-02-02',
        episodeCount: 1,
        id: 1,
        name: 'name',
        overview: 'overview',
        posterPath: 'posterPath',
        seasonNumber: 1,
        voteAverage: 1)
  ],
  status: 'Status',
  tagline: 'Tagline',
  type: 'Type',
  voteAverage: 1,
  voteCount: 1,
);

const tSeasonDetail = SeasonDetail(
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

final testTvSeries = TvSeries(
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

final testTvSeriesList = [testTvSeries];

final testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testTvSeriesTable = TvSeriesTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvSeriesMap = {
  'id': 1,
  'name': 'name',
  'posterPath': 'posterPath',
  'overview': 'overview',
};
