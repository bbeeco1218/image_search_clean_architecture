import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_api.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';
import 'package:image_search_clean_architecture/domain/repository/pixabay_repository.dart';

class PixabayRepositoryImpl implements PixabayRepository {
  final PixabayApi api;
  PixabayRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<PixabayImage>> fetch(String query) async {
    return await api.fetch(query);
  }
}
