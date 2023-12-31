import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_search_clean_architecture/data/pixabay/data_source/result.dart';
import 'package:image_search_clean_architecture/di/di_setup.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';
import 'package:image_search_clean_architecture/domain/use_case/get_pixabay_image_use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

typedef HomeScreenEmitter = Emitter<HomeScreenState>;

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<HomeScreenSearchValueChanged>(_onSearchValueChanged);
    on<HomeScreenSearchButtonTapped>(_onSearchButtonTapped);
  }

  final GetPixabayImageUseCase pixabayAPI = getIt<GetPixabayImageUseCase>();

  void _onSearchValueChanged(HomeScreenSearchValueChanged event, HomeScreenEmitter emit) {
    emit(state.copyWith(searchValue: event.searchValue));
  }

  Future<void> _onSearchButtonTapped(_, HomeScreenEmitter emit) async {
    emit(state.copyWith(imageGridStatus: ImageGridStatus.loading));
    final Result<List<PixabayImage>> newImages = await pixabayAPI.execute(state.searchValue);

    switch (newImages) {
      case Success<List<PixabayImage>>():
        emit(state.copyWith(
          images: newImages.data,
          imageGridStatus: ImageGridStatus.success,
        ));

      case Error<List<PixabayImage>>():
        emit(state.copyWith(
          images: [],
          imageGridStatus: ImageGridStatus.fail,
        ));
    }
  }
}
