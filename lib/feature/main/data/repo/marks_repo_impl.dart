import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:iti_graduation/core/constant/end_point.dart';
import 'package:iti_graduation/core/error/failure.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';

class MarksRepoImpl extends MarksRepo {
  @override
  Future<void> addMark({required MovieEntity movie}) {
    var bookMark = BookMarkEntity(
      id: movie.id,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath,
      voteCount: movie.voteCount,
    );
    try {
      var box = Hive.box<BookMarkEntity>(EndPoint.hiveEndPoint);
      box.put(movie.id, bookMark);
      return Future.value();
    } catch (e) {
      log(e.toString());
      return Future.error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> deleteMark({required MovieEntity movie}) async {
    try {
      var box = Hive.box<BookMarkEntity>(EndPoint.hiveEndPoint);
      box.delete(movie.id);
    } catch (e) {
      log(e.toString());
      return Future.error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookMarkEntity>>> fetchMarks() async {
    try {
      var box = Hive.box<BookMarkEntity>(EndPoint.hiveEndPoint);
      var bookMarks = box.values.toList();
      return Right(bookMarks);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  bool isMarked(MovieEntity movie) {
    var box = Hive.box<BookMarkEntity>(EndPoint.hiveEndPoint);
    return box.containsKey(movie.id);
  }
}
