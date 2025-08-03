import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/domain/repo/search_repo.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final SearchRepo searchRepo;
  MovieCubit(this.searchRepo) : super(MovieInitial());

  Future<void> searchMovies(String query) async {
    emit(MovieLoading());
    var result = await searchRepo.searchMovies(query);
    result.fold(
      (failure) => emit(MovieFailure(failure.errorMessage)),
      (success) => emit(MovieSuccess(success)),
    );
  }
}
