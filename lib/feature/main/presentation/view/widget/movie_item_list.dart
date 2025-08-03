import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/helper/dummy.dart';
import 'package:iti_graduation/core/widget/custom_empty_search.dart';
import 'package:iti_graduation/core/widget/custom_ready_search.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/Movie_cubit/movie_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/movie_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieItemList extends StatelessWidget {
  const MovieItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieSuccess) {
          if (state.movies.isEmpty) {
            return SliverToBoxAdapter(child: CustomEmptySearch());
          }

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: MovieItem(movie: state.movies[index]),
              ),
              childCount: state.movies.length,
            ),
          );
        } else if (state is MovieFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(state.failure, style: TextStyle(color: Colors.red)),
              ),
            ),
          );
        } else if (state is MovieLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  Skeletonizer(child: MovieItem(movie: Dummy.dummyMovie)),
              childCount: 10,
            ),
          );
        } else {
          return SliverToBoxAdapter(child: CustomReadySearch());
        }
      },
    );
  }
}
