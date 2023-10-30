import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const String baseUrl = 'https://pixabay.com/api/';
  static const String key = '40362740-15fd217a6947bf0402f98a5c5';

  Future<List<PixabayImage>> fetch(String query) async {
    final response = await client.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    Iterable hits = jsonResponse['hits'];

    return hits.map((e) {
      return PixabayImage.fromJson(e);
    }).toList();
  }
}
