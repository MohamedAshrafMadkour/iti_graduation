import 'package:flutter/material.dart';

class CustomEmptyBookMarks extends StatelessWidget {
  const CustomEmptyBookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.sentiment_dissatisfied_rounded,
              size: 70,
              color: Colors.amber.shade600,
            ),
            const SizedBox(height: 16),
            const Text(
              'Oops! No bookmarks yet.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start exploring and save your favorite movies!',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
