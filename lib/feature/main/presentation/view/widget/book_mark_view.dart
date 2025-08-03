import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/service/get_it_setup.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/display_marks/display_marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/book_marks_view_body.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DisplayMarksCubit(getIt.get<MarksRepo>())..fetchBookMarks(),
      child: BookMarksViewBody(),
    );
  }
}
