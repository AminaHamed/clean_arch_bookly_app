import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUlr}) : super(key: key);
  final String imageUlr;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imageUlr,
            fit: BoxFit.fill,
          ),
        ));
  }
}
