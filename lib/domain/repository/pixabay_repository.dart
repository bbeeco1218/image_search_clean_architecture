import 'package:image_search_clean_architecture/data/pixabay/data_source/result.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';

abstract class PixabayRepository {
  Future<Result<List<PixabayImage>>> fetch(String query);
}
