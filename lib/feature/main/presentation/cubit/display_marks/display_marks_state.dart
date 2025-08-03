part of 'display_marks_cubit.dart';

sealed class DisplayMarksState extends Equatable {
  const DisplayMarksState();

  @override
  List<Object> get props => [];
}

final class DisplayMarksInitial extends DisplayMarksState {}

final class DisplayMarksLoading extends DisplayMarksState {}

final class DisplayMarksSuccess extends DisplayMarksState {
  final List<BookMarkEntity> bookMarks;
  const DisplayMarksSuccess(this.bookMarks);
}

final class DisplayMarksFailure extends DisplayMarksState {
  final String message;
  const DisplayMarksFailure(this.message);
}
