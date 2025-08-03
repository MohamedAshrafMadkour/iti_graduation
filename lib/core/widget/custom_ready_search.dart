import 'package:flutter/material.dart';

class CustomReadySearch extends StatelessWidget {
  const CustomReadySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              size: 70,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 16),
            const Text(
              'Ready to explore?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Search for your favorite movies and discover something new! 😉',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
