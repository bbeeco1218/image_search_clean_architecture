import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  PixabayApi get pixabayApi => PixabayApi();
}
