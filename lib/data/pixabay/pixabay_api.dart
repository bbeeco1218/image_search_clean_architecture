import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_clean_architecture/data/pixabay/pixabay_repository.dart';

import 'package:image_search_clean_architecture/model/pixabay_image.dart';

class PixabayAPI implements PixabayRepository {
  final String baseUrl = 'https://pixabay.com/api/';
  final String key = '40362740-15fd217a6947bf0402f98a5c5';

  @override
  Future<List<PixabayImage>> fetch(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonRes = jsonDecode(response.body);

    Iterable hits = jsonRes['hits'];

    return hits.map((e) {
      return PixabayImage.fromJson(e);
    }).toList();
  }
}
