import 'package:flutter/material.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    required this.image,
    Key? key,
  }) : super(key: key);

  final PixabayImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image.previewURL),
        ),
      ),
    );
  }
}
