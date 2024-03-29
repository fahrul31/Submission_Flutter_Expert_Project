import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tv_series/popular_tv_series_bloc.dart';
import '../widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tv-series';

  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<PopularTvSeriesBloc>().add(FetchPopularTvSeries()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvSeriesBloc, PopularTvSeriesState>(
            builder: (context, state) {
          if (state is PopularTvSeriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PopularTvSeriesHasData) {
            final data = state.popularTvSeries;
            return ListView.builder(
              itemBuilder: (context, index) {
                final tvSeries = data[index];
                return TvSeriesCard(tvSeries);
              },
              itemCount: data.length,
            );
          } else if (state is PopularTvSeriesEmpty) {
            return const Text("Data Empty");
          } else if (state is PopularTvSeriesError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
