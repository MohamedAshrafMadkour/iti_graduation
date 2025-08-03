import 'package:flutter/material.dart';
import 'package:iti_graduation/core/widget/custom_cached_network_image.dart';
import 'package:iti_graduation/feature/main/domain/entity/movie_entity.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_bloc_icon.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_rating.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieEntity movie;
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
                image: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
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
                    movie.originalTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    movie.overview,
                  ),
                  SizedBox(height: 6),
                  CustomRating(movie: movie),
                ],
              ),
            ),
            CustomBlocIcon(movie: movie),
          ],
        ),
      ),
    );
  }
}
