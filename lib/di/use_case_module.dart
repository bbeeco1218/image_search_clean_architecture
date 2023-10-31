import 'package:image_search_clean_architecture/data/pixabay/repository/pixabay_repository_impl.dart';
import 'package:image_search_clean_architecture/domain/use_case/get_pixabay_image_use_case.dart';
import 'package:injectable/injectable.dart';

import 'di_setup.dart';

@module
abstract class UseCaseModule {
  @injectable
  GetPixabayImageUseCase get getPixabayImageUseCase => GetPixabayImageUseCase(pixabayRepository: getIt<PixabayRepositoryImpl>());
}
