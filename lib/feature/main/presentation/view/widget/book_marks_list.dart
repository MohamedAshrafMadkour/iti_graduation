import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/helper/dummy.dart';
import 'package:iti_graduation/core/widget/custom_error.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/display_marks/display_marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/book_marks_item.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_empty_book_marks.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookMarkList extends StatelessWidget {
  const BookMarkList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayMarksCubit, DisplayMarksState>(
      builder: (context, state) {
        if (state is DisplayMarksSuccess) {
          if (state.bookMarks.isEmpty) {
            return SliverToBoxAdapter(
              child: CustomEmptyBookMarks(),
            );
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: BookMarkItem(bookMark: state.bookMarks[index]),
              ),
              childCount: state.bookMarks.length,
            ),
          );
        } else if (state is DisplayMarksFailure) {
          return SliverToBoxAdapter(child: CustomError(error: state.message));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Skeletonizer(
                  child: BookMarkItem(bookMark: Dummy.dummyBookMark),
                ),
              ),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}

