import 'package:tv_series/utils/exception.dart';
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelperTvSeries mockDatabaseHelperTvSeries;

  setUp(() {
    mockDatabaseHelperTvSeries = MockDatabaseHelperTvSeries();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelperTvSeries);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvSeries
              .insertWatchTvSerieslist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.insertWatchTvSerieslist(testTvSeriesTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvSeries
              .insertWatchTvSerieslist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchTvSerieslist(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelperTvSeries
              .removeWatchTvSerieslist(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.removeWatchTvSerieslist(testTvSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperTvSeries
              .removeWatchTvSerieslist(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchTvSerieslist(testTvSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get tv series Detail By Id', () {
    final tId = 1;

    test('should return tv series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvSeriesById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelperTvSeries.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTv();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
