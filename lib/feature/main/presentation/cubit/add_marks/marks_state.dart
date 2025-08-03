part of 'marks_cubit.dart';

sealed class MarksState extends Equatable {
  const MarksState();

  @override
  List<Object> get props => [];
}

final class MarksInitial extends MarksState {}

final class MarksSuccess extends MarksState {}

final class MarksFailure extends MarksState {
  final String message;
  const MarksFailure(this.message);
}

final class MarksLoading extends MarksState {}
