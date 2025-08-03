import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

abstract class Dummy {
  static MovieEntity dummyMovie = MovieEntity(
    id: 0,
    originalTitle: "Anonymous Name",
    overview: "Anonymous Description",
    popularity: 0,
    posterPath: " ",
    voteCount: 0,
  );
  static BookMarkEntity dummyBookMark = BookMarkEntity(
    id: 0,
    originalTitle: "Anonymous Name",
    overview: "Anonymous Description",
    popularity: 0,
    posterPath: " ",
    voteCount: 0,
  );
}
