import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/service/get_it_setup.dart';
import 'package:iti_graduation/feature/main/domain/repo/search_repo.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/Movie_cubit/movie_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocProvider(
        create: (context) => MovieCubit(getIt.get<SearchRepo>()),
        child: SearchViewBody(),
      ),
    );
  }
}
