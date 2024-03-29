import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_movie/top_rated_movie_bloc.dart';
import '../widget/movie_card_list.dart';
import 'package:flutter/material.dart';

class TopRatedMoviesPage extends StatefulWidget {
  static const routeName = '/top-rated-movie';

  const TopRatedMoviesPage({super.key});

  @override
  State<TopRatedMoviesPage> createState() => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState extends State<TopRatedMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<TopRatedMovieBloc>().add(FetchTopRatedMovie()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedMovieBloc, TopRatedMovieState>(
            builder: (context, state) {
          if (state is TopRatedMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopRatedMovieHasData) {
            final data = state.topRatedMovies;
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = data[index];
                return MovieCard(movie);
              },
              itemCount: data.length,
            );
          } else if (state is TopRatedMovieEmpty) {
            return const Text("Data Empty");
          } else if (state is TopRatedMovieError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
