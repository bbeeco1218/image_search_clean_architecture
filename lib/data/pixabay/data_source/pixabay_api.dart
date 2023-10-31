import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search_clean_architecture/data/pixabay/data_source/result.dart';
import 'package:image_search_clean_architecture/domain/model/pixabay_image.dart';

class PixabayApi {
  final http.Client _client;

  PixabayApi({http.Client? client}) : _client = client ?? http.Client();

  static const String baseUrl = 'https://pixabay.com/api/';
  static const String key = '40362740-15fd217a6947bf0402f98a5c5';

  Future<Result<List<PixabayImage>>> fetch(String query) async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      Iterable hits = jsonResponse['hits'];

      return Result.success(
        hits.map((e) {
          return PixabayImage.fromJson(e);
        }).toList(),
      );
    } catch (e) {
      return Result.error('$e');
    }
  }
}
