import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';
import 'package:http/http.dart' as http;

part 'home_screen_event.dart';
part 'home_screen_state.dart';

typedef HomeScreenEmitter = Emitter<HomeScreenState>;

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<HomeScreenSearchValueChanged>(_onSearchValueChanged);
    on<HomeScreenSearchButtonTapped>(_onSearchButtonTapped);
  }

  void _onSearchValueChanged(HomeScreenSearchValueChanged event, HomeScreenEmitter emit) {
    emit(state.copyWith(searchValue: event.searchValue));
  }

  Future<void> _onSearchButtonTapped(_, HomeScreenEmitter emit) async {
    emit(state.copyWith(imageGridStatus: ImageGridStatus.loading));
    final List<PixabayImage> newImages = await fetch(state.searchValue);

    emit(state.copyWith(
      images: newImages,
      imageGridStatus: ImageGridStatus.success,
    ));
  }

  Future<List<PixabayImage>> fetch(String query) async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=40362740-15fd217a6947bf0402f98a5c5&q=$query&image_type=photo'));

    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    Iterable hits = jsonRes['hits'];

    return hits.map((e) {
      return PixabayImage.fromJson(e);
    }).toList();
  }
}
