part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class HomeScreenSearchValueChanged extends HomeScreenEvent {
  const HomeScreenSearchValueChanged({required this.searchValue});
  final String searchValue;

  @override
  List<Object?> get props => [
        searchValue,
      ];
}

class HomeScreenSearchButtonTapped extends HomeScreenEvent {
  const HomeScreenSearchButtonTapped();

  @override
  List<Object?> get props => [];
}
