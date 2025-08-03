import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/domain/entity/book_mark_entity.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 10),
        Text(movie.popularity.toString()),
        SizedBox(width: 10),
        Text('(${movie.voteCount})', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class CustomBookMarksRating extends StatelessWidget {
  const CustomBookMarksRating({super.key, required this.mark});

  final BookMarkEntity mark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 10),
        Text(mark.popularity.toString()),
        SizedBox(width: 10),
        Text('(${mark.voteCount})', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
