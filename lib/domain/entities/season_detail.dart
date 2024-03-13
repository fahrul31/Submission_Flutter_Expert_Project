import 'package:ditonton/domain/entities/episode.dart';
import 'package:equatable/equatable.dart';

class SeasonDetail extends Equatable {
  final int id;
  final String airDate;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final double voteAverage;

  SeasonDetail({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        airDate,
        id,
        episodes,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage
      ];
}
