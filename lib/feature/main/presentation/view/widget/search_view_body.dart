import 'package:flutter/material.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_text_field.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/movie_item_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        CustomTextField(),
        SizedBox(height: 30),
        Expanded(
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [MovieItemList()],
          ),
        ),
      ],
    );
  }
}
