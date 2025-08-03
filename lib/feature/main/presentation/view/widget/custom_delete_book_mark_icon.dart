import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/helper/custom_snack_bar.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/add_marks/marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/display_marks/display_marks_cubit.dart';

class CustomBlocDeleteIcon extends StatelessWidget {
  const CustomBlocDeleteIcon({super.key, required this.bookMark});
  final BookMarkEntity bookMark;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarksCubit, MarksState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<MarksCubit>().deleteBookMark(
              movie: bookMark.toEntity(),
            );
            customSnackBar(context, isAdded: false);
            context.read<DisplayMarksCubit>().fetchBookMarks();
          },
          icon: Icon(Icons.bookmark, size: 30, color: Colors.amber),
        );
      },
    );
  }
}
