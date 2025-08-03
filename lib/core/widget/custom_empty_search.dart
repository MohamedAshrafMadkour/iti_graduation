import 'package:flutter/material.dart';

class CustomEmptySearch extends StatelessWidget {
  const CustomEmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 70,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 16),
            const Text(
              'No results found!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We couldn\'t find anything matching your search.\nTry a different keyword.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
