import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation/feature/main/presentation/cubit/Movie_cubit/movie_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (query) {
        if (query.trim().isNotEmpty) {
          context.read<MovieCubit>().searchMovies(query.trim());
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: IconButton(
          onPressed: () {
            controller.clear();
          },
          icon: const Icon(Icons.close, color: Colors.black),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              context.read<MovieCubit>().searchMovies(controller.text.trim());
            }
          },
          icon: const Icon(Icons.search, color: Colors.black),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.black),
        border: customOutlineInputBorder(color: Colors.black),
        focusedBorder: customOutlineInputBorder(color: const Color(0xff004466)),
        enabledBorder: customOutlineInputBorder(color: const Color(0xff004466)),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
