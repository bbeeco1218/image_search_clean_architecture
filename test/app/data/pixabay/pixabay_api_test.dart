import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_clean_architecture/data/pixabay/pixabay_api.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';

void main() {
  test('api가 잘 동작 해야한다.', () async {
    final PixabayAPI pixabayAPI = PixabayAPI();

    final List<PixabayImage> images = await pixabayAPI.fetch('apple');

    expect(images.length, 20);
  });
}
