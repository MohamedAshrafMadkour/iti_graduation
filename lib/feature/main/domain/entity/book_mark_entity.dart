import 'package:hive/hive.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

part 'book_mark_entity.g.dart';

@HiveType(typeId: 0)
class BookMarkEntity extends HiveObject {
  @HiveField(0)
  final String originalTitle;
  @HiveField(1)
  final String overview;
  @HiveField(2)
  final double popularity;
  @HiveField(3)
  final String posterPath;
  @HiveField(4)
  final int voteCount;
  @HiveField(5)
  final int? id;

  BookMarkEntity({
    this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteCount,
  });

  MovieEntity toEntity() => MovieEntity(
    id: id ?? 0,
    originalTitle: originalTitle,
    overview: overview,
    popularity: popularity,
    posterPath: posterPath,
    voteCount: voteCount,
  );
}
