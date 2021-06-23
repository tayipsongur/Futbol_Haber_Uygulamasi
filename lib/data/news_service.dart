import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:okulprojesi/Model/article.dart';
import 'package:okulprojesi/Model/news.dart';

class NewsService{
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService(){
    return _singleton;
  }
  static Future<List<Articles>>getNews()async{
    String url = 'https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=d20161535e0f46f8bdfba185d1eb65a8';

    final response = await http.get(url);

    if(response.body.isNotEmpty){
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;

  }
}