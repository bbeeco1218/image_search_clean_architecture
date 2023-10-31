import 'package:image_search_clean_architecture/data/pixabay/data_source/result.dart';
import 'package:image_search_clean_architecture/data/pixabay/repository/pixabay_repository_impl.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';

class GetPixabayImageUseCase {
  final PixabayRepositoryImpl pixabayRepository;

  GetPixabayImageUseCase({required this.pixabayRepository});

  Future<Result<List<PixabayImage>>> execute(String query) async {
    final Result<List<PixabayImage>> result = await pixabayRepository.fetch(query);

    switch (result) {
      case Success<List<PixabayImage>>():
        return result;
      case Error<List<PixabayImage>>():
        return result;
    }
  }
}
