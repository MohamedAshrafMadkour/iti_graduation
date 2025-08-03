import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/add_marks/marks_cubit.dart';

class CustomBlocIcon extends StatefulWidget {
  const CustomBlocIcon({super.key, required this.movie});

  final MovieEntity movie;

  @override
  State<CustomBlocIcon> createState() => _CustomBlocIconState();
}

class _CustomBlocIconState extends State<CustomBlocIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarksCubit, MarksState>(
      builder: (context, state) {
        final isMarked = context.read<MarksCubit>().isBookMarked(
          movie: widget.movie,
        );
        return IconButton(
          onPressed: () {
            if (isMarked) {
              context.read<MarksCubit>().deleteBookMark(movie: widget.movie);
            } else {
              context.read<MarksCubit>().addBookMark(movie: widget.movie);
            }
          },
          icon: isMarked
              ? Icon(Icons.bookmark, size: 30, color: Colors.amber)
              : Icon(Icons.bookmark_border_outlined, size: 30),
        );
      },
    );
  }
}
