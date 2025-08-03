import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, {required bool isAdded}) {
  final message = isAdded
      ? 'Item added to bookmarks 🎉'
      : 'Item removed from bookmarks 🗑️ ';

  final snackBar = SnackBar(
    content: Text(message, style: const TextStyle(fontSize: 16)),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    backgroundColor: isAdded ? Colors.green[400] : Colors.red[500],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
