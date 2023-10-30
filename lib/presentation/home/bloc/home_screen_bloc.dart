import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_search_clean_architecture/data/pixabay/data_source/pixabay_data_source.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

typedef HomeScreenEmitter = Emitter<HomeScreenState>;

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<HomeScreenSearchValueChanged>(_onSearchValueChanged);
    on<HomeScreenSearchButtonTapped>(_onSearchButtonTapped);
  }

  final PixabayDataSource pixabayAPI = PixabayDataSource();

  void _onSearchValueChanged(HomeScreenSearchValueChanged event, HomeScreenEmitter emit) {
    emit(state.copyWith(searchValue: event.searchValue));
  }

  Future<void> _onSearchButtonTapped(_, HomeScreenEmitter emit) async {
    emit(state.copyWith(imageGridStatus: ImageGridStatus.loading));
    final List<PixabayImage> newImages = await pixabayAPI.fetch(state.searchValue);

    emit(state.copyWith(
      images: newImages,
      imageGridStatus: ImageGridStatus.success,
    ));
  }
}
