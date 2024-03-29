import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_series/top_rated_tv_series_bloc.dart';
import '../widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopRatedTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv-series-page';

  @override
  _TopRatedTvSeriesPageState createState() => _TopRatedTvSeriesPageState();
}

class _TopRatedTvSeriesPageState extends State<TopRatedTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<TopRatedTvSeriesBloc>().add(FetchTopRatedTvSeries()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TopRatedTvSeriesBloc, TopRatedTvSeriesState>(
            builder: (context, state) {
          if (state is TopRatedTvSeriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TopRatedTvSeriesHasData) {
            final data = state.topRatedTvSeries;
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvSeries = data[index];
                return TvSeriesCard(tvSeries);
              },
              itemCount: data.length,
            );
          } else if (state is TopRatedTvSeriesEmpty) {
            return const Text("Data Empty");
          } else if (state is TopRatedTvSeriesError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
