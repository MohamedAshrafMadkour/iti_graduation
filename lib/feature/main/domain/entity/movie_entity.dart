class MovieEntity {
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final int voteCount;

  MovieEntity({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteCount,
  });
}
