part of 'movie_cubit.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final List<MovieEntity> movies;
  const MovieSuccess(this.movies);
}

final class MovieFailure extends MovieState {
  final String failure;
  const MovieFailure(this.failure);
}
