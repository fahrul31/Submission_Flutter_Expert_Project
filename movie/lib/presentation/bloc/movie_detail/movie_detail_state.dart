part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

final class MovieDetailEmpty extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}

final class MovieDetailHasData extends MovieDetailState {
  final MovieDetail movieDetail;
  final List<Movie> movieRecommendations;

  const MovieDetailHasData(this.movieDetail, this.movieRecommendations);

  @override
  List<Object> get props => [
        movieDetail,
        movieRecommendations,
      ];
}
