import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/bloc/tv_series_season_detail/tv_series_season_detail_bloc.dart';
import 'package:tv_series/styles/colors.dart';
import 'package:tv_series/styles/text_styles.dart';
import '../../domain/entities/season_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesSeasonDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv-series-season';

  final int id;
  final int seasonNumber;
  TvSeriesSeasonDetailPage({required this.id, required this.seasonNumber});

  @override
  _TvSeriesSeasonDetailPageState createState() =>
      _TvSeriesSeasonDetailPageState();
}

class _TvSeriesSeasonDetailPageState extends State<TvSeriesSeasonDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<TvSeriesDetailSeasonBloc>().add(
            FetchTvSeriesDetailSeason(widget.id, widget.seasonNumber),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvSeriesDetailSeasonBloc, TvSeriesDetailSeasonState>(
          builder: (context, state) {
        if (state is TvSeriesDetailSeasonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TvSeriesDetailSeasonHasData) {
          final tvSeriesSeason = state.TvSeriesDetailSeason;
          return SafeArea(
            child: DetailContent(tvSeriesSeason),
          );
        } else if (state is TvSeriesDetailSeasonEmpty) {
          return const Text("Data Empty");
        } else if (state is TvSeriesDetailSeasonError) {
          return Text(state.message);
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

class DetailContent extends StatelessWidget {
  final SeasonDetail season;

  DetailContent(this.season);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${season.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              season.name,
                              style: kHeading5,
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: season.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${season.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            season.overview != ""
                                ? Text(season.overview)
                                : const Text("Not available overview"),
                            const SizedBox(height: 16),
                            Text(
                              'Episode',
                              style: kHeading6,
                            ),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: season.episodes.length,
                              itemBuilder: (context, index) {
                                final episode = season.episodes[index];
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w500${episode.stillPath}',
                                              placeholder: (context, url) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                episode.name!,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                episode.overview!,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}
