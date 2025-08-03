import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/book_marks_list.dart';

class BookMarksViewBody extends StatelessWidget {
  const BookMarksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          BookMarkList(),
        ],
      ),
    );
  }
}
