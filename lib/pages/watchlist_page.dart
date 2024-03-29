import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/bloc/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:movie/presentation/widget/movie_card_list.dart';
import 'package:tv_series/presentation/bloc/watchlist_tv_series/watchlist_tv_series_bloc.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';
import 'package:movie/utils/utils.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist';

  const WatchlistPage({super.key});

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistMovieBloc>().add(FetchWatchlistMovie());
      context.read<WatchlistTvSeriesBloc>().add(FetchWatchlistTvSeries());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<WatchlistMovieBloc>().add(FetchWatchlistMovie());
    context.read<WatchlistTvSeriesBloc>().add(FetchWatchlistTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
                builder: (context, state) {
              if (state is WatchlistMovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WatchlistMovieHasData) {
                final data = state.watchlistMovies;
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = data[index];
                    return MovieCard(movie);
                  },
                  itemCount: data.length,
                );
              } else if (state is WatchlistMovieEmpty) {
                return const Text("Data Empty");
              } else if (state is WatchlistMovieError) {
                return Text(state.message);
              } else {
                return const SizedBox();
              }
            }),
            BlocBuilder<WatchlistTvSeriesBloc, WatchlistTvSeriesState>(
                builder: (context, state) {
              if (state is WatchlistTvSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WatchlistTvSeriesHasData) {
                final data = state.watchlistTvSeriess;
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final tvSeries = data[index];
                    return TvSeriesCard(tvSeries);
                  },
                  itemCount: data.length,
                );
              } else if (state is WatchlistTvSeriesEmpty) {
                return const Text("Data Empty");
              } else if (state is WatchlistTvSeriesError) {
                return Text(state.message);
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
