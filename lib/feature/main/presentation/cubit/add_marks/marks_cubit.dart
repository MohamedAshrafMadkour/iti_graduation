import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';

part 'marks_state.dart';

class MarksCubit extends Cubit<MarksState> {
  MarksCubit(this.marksRepo) : super(MarksInitial());
  final MarksRepo marksRepo;
  void addBookMark({required MovieEntity movie}) async {
    emit(MarksLoading());
    try {
      await marksRepo.addMark(movie: movie);
      emit(MarksSuccess());
    } catch (e) {
      emit(MarksFailure(e.toString()));
    }
  }

  void deleteBookMark({required MovieEntity movie}) async {
    emit(MarksLoading());
    try {
      await marksRepo.deleteMark(movie: movie);
      emit(MarksSuccess());
    } catch (e) {
      emit(MarksFailure(e.toString()));
    }
  }

  bool isBookMarked({required MovieEntity movie}) {
    return marksRepo.isMarked(movie);
  }
}
