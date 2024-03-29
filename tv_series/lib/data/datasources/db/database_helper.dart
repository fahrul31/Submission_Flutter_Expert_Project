import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../../models/tv_series_table.dart';

class DatabaseHelperTvSeries {
  static DatabaseHelperTvSeries? _databaseHelperTvSeries;
  DatabaseHelperTvSeries._instance() {
    _databaseHelperTvSeries = this;
  }

  factory DatabaseHelperTvSeries() =>
      _databaseHelperTvSeries ?? DatabaseHelperTvSeries._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';
  static const String _tblWatchlistTvSeries = 'watchlisttvseries';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $_tblWatchlistTvSeries (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchTvSerieslist(TvSeriesTable tv) async {
    final db = await database;
    return await db!.insert(_tblWatchlistTvSeries, tv.toJson());
  }

  Future<int> removeWatchTvSerieslist(TvSeriesTable tv) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlistTvSeries,
      where: 'id = ?',
      whereArgs: [tv.id],
    );
  }

  Future<Map<String, dynamic>?> getTvSeriesById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlistTvSeries,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvSeries() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(_tblWatchlistTvSeries);

    return results;
  }
}
