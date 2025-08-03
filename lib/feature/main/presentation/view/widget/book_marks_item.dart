import 'package:flutter/material.dart';
import 'package:iti_graduation/core/widget/custom_cached_network_image.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_delete_book_mark_icon.dart';
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
