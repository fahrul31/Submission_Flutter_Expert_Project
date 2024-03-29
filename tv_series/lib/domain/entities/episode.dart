import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String? airDate;
  final int episodeNumber;
  final int id;
  final String? name;
  final String? overview;
  final String? stillPath;
  final double voteAverage;

  const Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.id,
    required this.name,
    required this.overview,
    required this.stillPath,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        id,
        name,
        overview,
        stillPath,
        voteAverage,
      ];
}
