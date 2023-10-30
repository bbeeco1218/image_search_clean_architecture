import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_clean_architecture/model/pixabay_image.dart';
import 'package:image_search_clean_architecture/presentation/home/bloc/home_screen_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/widget/photo_item.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<List<PixabayImage>> fetch(String query) async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=40362740-15fd217a6947bf0402f98a5c5&q=$query&image_type=photo'));

    Map<String, dynamic> jsonRes = jsonDecode(response.body);
    Iterable hits = jsonRes['hits'];

    return hits.map((e) => PixabayImage.fromJson(e)).toList();
  }

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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return PhotoItem(
                  image: PixabayImage.empty(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
