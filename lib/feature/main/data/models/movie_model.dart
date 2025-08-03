import 'package:equatable/equatable.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

class MovieModel extends Equatable {
  final int? id;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final int? voteCount;

  const MovieModel({
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json['id'] as int?,
    originalTitle: json['original_title'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    voteCount: json['vote_count'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'vote_count': voteCount,
  };
  MovieEntity toEntity() {
    return MovieEntity(
      id: id ?? 0,
      originalTitle: originalTitle ?? "Anonymous Name",
      overview: overview ?? "Anonymous Description",
      popularity: popularity ?? 0,
      posterPath: posterPath ?? " ",
      voteCount: voteCount ?? 0,
    );
  }

  @override
  List<Object?> get props {
    return [originalTitle, overview, popularity, posterPath, voteCount];
  }
}
