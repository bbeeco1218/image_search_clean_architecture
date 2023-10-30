import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_data_source.dart';
import 'package:image_search_clean_architecture/data/pixabay/repository/pixabay_repository.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';
import 'package:http/http.dart' as http;

class PixabayRepositoryImpl implements PixabayRepository {
  @override
  Future<List<PixabayImage>> fetch(String query) {
    throw UnimplementedError();
  }
}
