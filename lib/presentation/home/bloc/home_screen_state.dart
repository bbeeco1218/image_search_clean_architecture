part of 'home_screen_bloc.dart';

enum ImageGridStatus {
  loading,
  success,
  fail,
  ;

  bool get isSuccess => this == success;
  bool get isLoading => this == loading;
}

class HomeScreenState extends Equatable {
  const HomeScreenState({
    required this.searchValue,
    required this.images,
    required this.imageGridStatus,
  });

  final String searchValue;
  final List<PixabayImage> images;
  final ImageGridStatus imageGridStatus;

  factory HomeScreenState.initial() {
    return const HomeScreenState(
      searchValue: '',
      images: [],
      imageGridStatus: ImageGridStatus.success,
    );
  }

  HomeScreenState copyWith({
    String? searchValue,
    List<PixabayImage>? images,
    ImageGridStatus? imageGridStatus,
  }) {
    return HomeScreenState(
      searchValue: searchValue ?? this.searchValue,
      images: images ?? this.images,
      imageGridStatus: imageGridStatus ?? this.imageGridStatus,
    );
  }

  @override
  List<Object> get props => [
        searchValue,
        images,
        imageGridStatus,
      ];
}
