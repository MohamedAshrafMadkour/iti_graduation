import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red, width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
