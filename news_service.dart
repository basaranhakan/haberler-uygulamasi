import 'dart:convert';
import 'package:haberuygulamasi/models/articles.dart';
import 'package:haberuygulamasi/models/news.dart';

import 'package:http/http.dart' as http;

class NewsServise {
  Future<List<Articles>> fetchNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=0572640211454c96839506a307b5f0fe";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      News news = News.fromJson(result);
       return news.articles ?? [];
     }
    throw Exception("Bad Request");
  }
}
