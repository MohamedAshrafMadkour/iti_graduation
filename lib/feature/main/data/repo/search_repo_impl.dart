import 'package:dartz/dartz.dart';
import 'package:iti_graduation/core/constant/keys.dart';
import 'package:iti_graduation/core/error/failure.dart';
import 'package:iti_graduation/core/service/api_service.dart';
import 'package:iti_graduation/feature/main/data/models/movie_model.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/domain/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      var data = await apiService.get(
        endPoint: 'search/movie?',
        query: {'query': query, 'api_key': Keys.apiKey},
        token: Keys.token,
      );
      List<MovieEntity> movies = [];
      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(movie).toEntity());
      }
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

//https://api.themoviedb.org/3/search/movie?api_key=YOUR_API_KEY&query=inception
