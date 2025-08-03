import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/core/service/get_it_setup.dart';
import 'package:iti_graduation/feature/main/domain/repo/marks_repo.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/add_marks/marks_cubit.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/custom_bottom_nav_bar.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/book_mark_view.dart';
import 'package:iti_graduation/feature/main/presentation/view/widget/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarksCubit(getIt.get<MarksRepo>()),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
          onItemTapped: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        body: SafeArea(child: pages[currentIndex]),
      ),
    );
  }
}

List<Widget> pages = <Widget>[SearchView(), BookMarkView()];
