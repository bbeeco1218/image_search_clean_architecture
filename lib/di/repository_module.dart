import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_api.dart';
import 'package:image_search_clean_architecture/data/pixabay/repository/pixabay_repository_impl.dart';

import 'package:injectable/injectable.dart';

import 'di_setup.dart';

@module
abstract class RepositoryModule {
  @injectable
  PixabayRepositoryImpl get photoRepository => PixabayRepositoryImpl(api: getIt<PixabayApi>());
}
