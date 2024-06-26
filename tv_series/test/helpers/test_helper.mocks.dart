// Mocks generated by Mockito 5.4.4 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:convert' as _i21;
import 'dart:typed_data' as _i22;

import 'package:dartz/dartz.dart' as _i2;
import 'package:http/io_client.dart' as _i5;
import 'package:http/src/base_request.dart' as _i20;
import 'package:http/src/response.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i19;
import 'package:sqflite/sqflite.dart' as _i9;
import 'package:tv_series/data/datasources/db/database_helper.dart' as _i7;
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart'
    as _i18;
import 'package:tv_series/data/datasources/tv_series_remote_data_source.dart'
    as _i16;
import 'package:tv_series/data/models/season_detail_model.dart' as _i4;
import 'package:tv_series/data/models/tv_series_detail_model.dart' as _i3;
import 'package:tv_series/data/models/tv_series_model.dart' as _i17;
import 'package:tv_series/data/models/tv_series_table.dart' as _i10;
import 'package:tv_series/domain/entities/season_detail.dart' as _i15;
import 'package:tv_series/domain/entities/tv_series.dart' as _i13;
import 'package:tv_series/domain/entities/tv_series_detail.dart' as _i14;
import 'package:tv_series/domain/repositories/tv_series_repository.dart'
    as _i11;
import 'package:tv_series/utils/failure.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailResponse_1 extends _i1.SmartFake
    implements _i3.TvSeriesDetailResponse {
  _FakeTvSeriesDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSeasonDetailResponse_2 extends _i1.SmartFake
    implements _i4.SeasonDetailResponse {
  _FakeSeasonDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIOStreamedResponse_3 extends _i1.SmartFake
    implements _i5.IOStreamedResponse {
  _FakeIOStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DatabaseHelperTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTvSeries extends _i1.Mock
    implements _i7.DatabaseHelperTvSeries {
  MockDatabaseHelperTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i9.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i8.Future<_i9.Database?>.value(),
      ) as _i8.Future<_i9.Database?>);

  @override
  _i8.Future<int> insertWatchTvSerieslist(_i10.TvSeriesTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchTvSerieslist,
          [tv],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<int> removeWatchTvSerieslist(_i10.TvSeriesTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchTvSerieslist,
          [tv],
        ),
        returnValue: _i8.Future<int>.value(0),
      ) as _i8.Future<int>);

  @override
  _i8.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i8.Future<Map<String, dynamic>?>.value(),
      ) as _i8.Future<Map<String, dynamic>?>);

  @override
  _i8.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue: _i8.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i8.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i11.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>
      getNowPlayingTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getNowPlayingTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                    _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
              this,
              Invocation.method(
                #getNowPlayingTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                    _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                    _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, _i14.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i12.Failure, _i14.TvSeriesDetail>>.value(
                _FakeEither_0<_i12.Failure, _i14.TvSeriesDetail>(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, _i14.TvSeriesDetail>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>
      getTvSeriesRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTvSeriesRecommendations,
              [id],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                    _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
              this,
              Invocation.method(
                #getTvSeriesRecommendations,
                [id],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, _i15.SeasonDetail>>
      getTvSeriesSeasonDetail(
    int? id,
    int? seasonNumber,
  ) =>
          (super.noSuchMethod(
            Invocation.method(
              #getTvSeriesSeasonDetail,
              [
                id,
                seasonNumber,
              ],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, _i15.SeasonDetail>>.value(
                    _FakeEither_0<_i12.Failure, _i15.SeasonDetail>(
              this,
              Invocation.method(
                #getTvSeriesSeasonDetail,
                [
                  id,
                  seasonNumber,
                ],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, _i15.SeasonDetail>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, String>> saveWatchlist(
          _i14.TvSeriesDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [tv],
        ),
        returnValue: _i8.Future<_i2.Either<_i12.Failure, String>>.value(
            _FakeEither_0<_i12.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [tv],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, String>>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, String>> removeWatchlist(
          _i14.TvSeriesDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [tv],
        ),
        returnValue: _i8.Future<_i2.Either<_i12.Failure, String>>.value(
            _FakeEither_0<_i12.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [tv],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i12.Failure, String>>);

  @override
  _i8.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i8.Future<bool>.value(false),
      ) as _i8.Future<bool>);

  @override
  _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>
      getWatchlistTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvSeries,
              [],
            ),
            returnValue:
                _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>.value(
                    _FakeEither_0<_i12.Failure, List<_i13.TvSeries>>(
              this,
              Invocation.method(
                #getWatchlistTvSeries,
                [],
              ),
            )),
          ) as _i8.Future<_i2.Either<_i12.Failure, List<_i13.TvSeries>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i16.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<List<_i17.TvSeriesModel>> getNowPlayingTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);

  @override
  _i8.Future<List<_i17.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);

  @override
  _i8.Future<List<_i17.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTvSeries,
          [],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);

  @override
  _i8.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesDetail,
          [id],
        ),
        returnValue: _i8.Future<_i3.TvSeriesDetailResponse>.value(
            _FakeTvSeriesDetailResponse_1(
          this,
          Invocation.method(
            #getTvSeriesDetail,
            [id],
          ),
        )),
      ) as _i8.Future<_i3.TvSeriesDetailResponse>);

  @override
  _i8.Future<List<_i17.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesRecommendations,
          [id],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);

  @override
  _i8.Future<List<_i17.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i8.Future<List<_i17.TvSeriesModel>>.value(<_i17.TvSeriesModel>[]),
      ) as _i8.Future<List<_i17.TvSeriesModel>>);

  @override
  _i8.Future<_i4.SeasonDetailResponse> getTvSeriesSeasonDetail(
    int? id,
    int? seasonNumber,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesSeasonDetail,
          [
            id,
            seasonNumber,
          ],
        ),
        returnValue: _i8.Future<_i4.SeasonDetailResponse>.value(
            _FakeSeasonDetailResponse_2(
          this,
          Invocation.method(
            #getTvSeriesSeasonDetail,
            [
              id,
              seasonNumber,
            ],
          ),
        )),
      ) as _i8.Future<_i4.SeasonDetailResponse>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i18.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<String> insertWatchTvSerieslist(_i10.TvSeriesTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchTvSerieslist,
          [tv],
        ),
        returnValue: _i8.Future<String>.value(_i19.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchTvSerieslist,
            [tv],
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<String> removeWatchTvSerieslist(_i10.TvSeriesTable? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchTvSerieslist,
          [tv],
        ),
        returnValue: _i8.Future<String>.value(_i19.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchTvSerieslist,
            [tv],
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i10.TvSeriesTable?> getTvById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTvById,
          [id],
        ),
        returnValue: _i8.Future<_i10.TvSeriesTable?>.value(),
      ) as _i8.Future<_i10.TvSeriesTable?>);

  @override
  _i8.Future<List<_i10.TvSeriesTable>> getWatchlistTv() => (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTv,
          [],
        ),
        returnValue:
            _i8.Future<List<_i10.TvSeriesTable>>.value(<_i10.TvSeriesTable>[]),
      ) as _i8.Future<List<_i10.TvSeriesTable>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.IOClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.IOStreamedResponse> send(_i20.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i8.Future<_i5.IOStreamedResponse>.value(_FakeIOStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i8.Future<_i5.IOStreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i21.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i8.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i8.Future<_i6.Response>);

  @override
  _i8.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<String>.value(_i19.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i8.Future<String>);

  @override
  _i8.Future<_i22.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i8.Future<_i22.Uint8List>.value(_i22.Uint8List(0)),
      ) as _i8.Future<_i22.Uint8List>);
}
