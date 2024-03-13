import 'package:ditonton/domain/entities/season_detail.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/get_tv_series_season_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvSeriesSeasonDetailNotifier extends ChangeNotifier {
  final GetTvSeriesSeasonDetail getTvSeriesSeasonDetail;

  TvSeriesSeasonDetailNotifier({
    required this.getTvSeriesSeasonDetail,
  });

  late SeasonDetail _tvSeriesSeason;
  SeasonDetail get tvSeriesSeason => _tvSeriesSeason;

  RequestState _tvSeriesSeasonState = RequestState.Empty;
  RequestState get tvSeriesSeasonState => _tvSeriesSeasonState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchSeasonDetail(int id, int seasonNumber) async {
    _tvSeriesSeasonState = RequestState.Loading;
    notifyListeners();

    final result = await getTvSeriesSeasonDetail.execute(id, seasonNumber);
    result.fold(
      (failure) {
        _tvSeriesSeasonState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (TvSeriesData) {
        _tvSeriesSeasonState = RequestState.Loaded;
        _tvSeriesSeason = TvSeriesData;
        notifyListeners();
      },
    );
  }
}
