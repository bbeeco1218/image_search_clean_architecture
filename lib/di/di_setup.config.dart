// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_api.dart'
    as _i4;
import 'package:image_search_clean_architecture/data/pixabay/repository/pixabay_repository_impl.dart'
    as _i5;
import 'package:image_search_clean_architecture/di/app_module.dart' as _i7;
import 'package:image_search_clean_architecture/di/repository_module.dart'
    as _i8;
import 'package:image_search_clean_architecture/di/use_case_module.dart' as _i6;
import 'package:image_search_clean_architecture/domain/use_case/get_pixabay_image_use_case.dart'
    as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final useCaseModule = _$UseCaseModule();
    final appModule = _$AppModule();
    final repositoryModule = _$RepositoryModule();
    gh.factory<_i3.GetPixabayImageUseCase>(
        () => useCaseModule.getPixabayImageUseCase);
    gh.singleton<_i4.PixabayApi>(appModule.pixabayApi);
    gh.factory<_i5.PixabayRepositoryImpl>(
        () => repositoryModule.photoRepository);
    return this;
  }
}

class _$UseCaseModule extends _i6.UseCaseModule {}

class _$AppModule extends _i7.AppModule {}

class _$RepositoryModule extends _i8.RepositoryModule {}
