import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/bloc/home_screen_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/widget/photo_fail_view.dart';
import 'package:image_search_clean_architecture/presentation/home/widget/photo_grid_view.dart';

import 'package:image_search_clean_architecture/presentation/home/widget/photo_loading_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Image App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => context.read<HomeScreenBloc>().add(HomeScreenSearchValueChanged(searchValue: value)),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () => context.read<HomeScreenBloc>().add(const HomeScreenSearchButtonTapped()),
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          BlocSelector<HomeScreenBloc, HomeScreenState, ImageGridStatus>(
            selector: (state) => state.imageGridStatus,
            builder: (context, imageGridStatus) {
              switch (imageGridStatus) {
                case ImageGridStatus.fail:
                  return const PhotoFailView();
                case ImageGridStatus.loading:
                  return const PhotoLoadingView();
                case ImageGridStatus.success:
                  return const PhotoGridView();
              }
            },
          ),
        ],
      ),
    );
  }
}
