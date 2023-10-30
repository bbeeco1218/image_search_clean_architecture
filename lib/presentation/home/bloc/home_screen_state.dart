part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    required this.searchValue,
  });

  final String searchValue;

  factory HomeScreenState.initial() {
    return const HomeScreenState(
      searchValue: '',
    );
  }

  HomeScreenState copyWith({
    String? searchValue,
  }) {
    return HomeScreenState(
      searchValue: searchValue ?? this.searchValue,
    );
  }

  @override
  List<Object> get props => [
        searchValue,
      ];
}
