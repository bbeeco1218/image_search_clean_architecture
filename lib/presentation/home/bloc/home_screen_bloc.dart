import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState.initial()) {
    on<HomeScreenSearchValueChanged>(_onSearchValueChanged);
  }

  void _onSearchValueChanged(HomeScreenSearchValueChanged event, Emitter<HomeScreenState> emit) {
    emit(state.copyWith(searchValue: event.searchValue));
  }
}
