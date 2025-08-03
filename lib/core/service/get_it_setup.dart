import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iti_graduation/core/service/api_service.dart';
import 'package:iti_graduation/feature/main/data/repo/marks_repo_impl.dart';
import 'package:iti_graduation/feature/main/data/repo/search_repo_impl.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';
import 'package:iti_graduation/feature/main/domain/repo/search_repo.dart';

final getIt = GetIt.instance;
getItSetup() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<MarksRepo>(MarksRepoImpl());
}
