import 'package:image_search_clean_architecture/model/pixabay_image.dart';

abstract class PixabayRepository {
  Future<List<PixabayImage>> fetch(String query);
}
