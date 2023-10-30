import 'package:flutter/material.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    required this.image,
    Key? key,
  }) : super(key: key);

  final PixabayImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg'),
        ),
      ),
    );
  }
}
