import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/widget/custom_cached_network_image.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/add_marks/marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/display_marks/display_marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_rating.dart';

class BookMarkItem extends StatelessWidget {
  const BookMarkItem({super.key, required this.bookMark});
  final BookMarkEntity bookMark;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .13,
              width: MediaQuery.sizeOf(context).width * .25,
              child: CustomCachedNetworkImage(
                image: "https://image.tmdb.org/t/p/w500${bookMark.posterPath}",
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    bookMark.originalTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    bookMark.overview,
                  ),
                  SizedBox(height: 6),
                  CustomBookMarksRating(mark: bookMark),
                ],
              ),
            ),
            CustomBlocDeleteIcon(bookMark: bookMark),
          ],
        ),
      ),
    );
  }
}

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
            context.read<DisplayMarksCubit>().fetchBookMarks();
          },
          icon: Icon(Icons.bookmark, size: 30, color: Colors.amber),
        );
      },
    );
  }
}
