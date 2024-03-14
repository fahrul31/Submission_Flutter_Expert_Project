import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_series_table.dart';
import 'package:ditonton/domain/entities/episode.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/season_detail.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvSeriesDetail = TvSeriesDetail(
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

final testSeasonDetail = SeasonDetail(
  id: 1,
  airDate: '2020-02-02',
  episodes: [
    Episode(
      airDate: '2019-04-06',
      episodeNumber: 1,
      id: 1,
      name: 'Cruelty',
      overview:
          'It is the Taisho Period (i.e. 1912-1926). Tanjiro Kamado is living a modest but blissful life in the mountains with his family. One day, when he returns from selling charcoal in town, he finds the remains of his slaughtered family in pools of blood after a demon attack. Tanjiro rushes down the snowy mountain with the sole survivor, his sister Nezuko, on his back. But on the way, Nezuko suddenly snarls, turning on Tanjiro.',
      stillPath: '/stillPath.jpg',
      voteAverage: 1.0,
    )
  ],
  name: 'Name',
  overview: 'Overview',
  posterPath: '/path.jpg',
  seasonNumber: 1,
  voteAverage: 1.0,
);

final testTvSeries = TvSeries(
  adult: false,
  backdropPath: '/nTvM4mhqNlHIvUkI1gVnW6XP7GG.jpg',
  genreIds: [16, 10759, 10765],
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

final testTvSeriesTable = TvSeriesTable(
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
