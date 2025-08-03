import 'package:dartz/dartz.dart';
import 'package:iti_graduation/core/error/failure.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

abstract class MarksRepo {
  Future addMark({required MovieEntity movie});
  Future<void> deleteMark({required MovieEntity movie});
  Future<Either<Failure, List<BookMarkEntity>>> fetchMarks();
  bool isMarked(MovieEntity movie);
}
