import 'package:dartz/dartz.dart';
import 'package:iti_graduation/core/error/failure.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);
}
