import 'package:tv_series/utils/exception.dart';
import 'db/database_helper.dart';
import '../models/tv_series_table.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchTvSerieslist(TvSeriesTable tv);
  Future<String> removeWatchTvSerieslist(TvSeriesTable tv);
  Future<TvSeriesTable?> getTvById(int id);
  Future<List<TvSeriesTable>> getWatchlistTv();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelperTvSeries databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchTvSerieslist(TvSeriesTable tv) async {
    try {
      await databaseHelper.insertWatchTvSerieslist(tv);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchTvSerieslist(TvSeriesTable tv) async {
    try {
      await databaseHelper.removeWatchTvSerieslist(tv);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSeriesTable?> getTvById(int id) async {
    final result = await databaseHelper.getTvSeriesById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTv() async {
    final result = await databaseHelper.getWatchlistTvSeries();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }
}
