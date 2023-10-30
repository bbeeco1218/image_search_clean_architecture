import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';
import 'package:image_search_clean_architecture/presentation/home/bloc/home_screen_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/widget/photo_empty_view.dart';
import 'package:image_search_clean_architecture/presentation/home/widget/photo_item.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeScreenBloc, HomeScreenState, List<PixabayImage>>(
      selector: (state) => state.images,
      builder: (context, images) {
        if (images.isEmpty) return const PhotoEmptyView();

        return Expanded(
          child: GridView.builder(
            itemCount: images.length,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return PhotoItem(
                image: images[index],
              );
            },
          ),
        );
      },
    );
  }
}
