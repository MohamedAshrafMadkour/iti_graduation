import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';

part 'display_marks_state.dart';

class DisplayMarksCubit extends Cubit<DisplayMarksState> {
  DisplayMarksCubit(this.marksRepo) : super(DisplayMarksInitial());
  final MarksRepo marksRepo;
  void fetchBookMarks() async {
    emit(DisplayMarksLoading());
    var result = await marksRepo.fetchMarks();
    result.fold(
      (failure) => emit(DisplayMarksFailure(failure.errorMessage)),
      (success) => emit(DisplayMarksSuccess(success)),
    );
  }
}
