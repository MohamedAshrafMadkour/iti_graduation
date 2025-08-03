import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 1.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          placeholder: (context, url) => Skeletonizer(
            child: Container(width: 100, height: 100, color: Colors.white),
          ),
          errorWidget: (context, url, error) => Column(
            children: [
              const Icon(Icons.broken_image, size: 60, color: Colors.redAccent),
              SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  maxLines: 1,
                  "bad image",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
