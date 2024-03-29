import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import '../widget/movie_card_list.dart';
import 'package:flutter/material.dart';

class PopularMoviesPage extends StatefulWidget {
  static const routeName = '/popular-movie';

  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<PopularMovieBloc>().add(FetchPopularMovie()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
            builder: (context, state) {
          if (state is PopularMovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopularMovieHasData) {
            final data = state.popularMovies;
            return ListView.builder(
              itemBuilder: (context, index) {
                final movie = data[index];
                return MovieCard(movie);
              },
              itemCount: data.length,
            );
          } else if (state is PopularMovieEmpty) {
            return const Text("Data Empty");
          } else if (state is PopularMovieError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
