import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_apppp/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final Dio _dio = Dio();
  final List<News> _fetchedInfo = [];
  List<News> get fetchedInfo => _fetchedInfo;

  getNewsFromApi() async {
    http.Response newsInfo = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-12-07&sortBy=publishedAt&apiKey=8207e18b9fc34d4ba4cfe769384981e5"));
    if (newsInfo.statusCode == 200) {
      try {
         var a = jsonDecode(newsInfo.body);
        List b = a['articles'];
        log(b.toString());
      //  List<News> Newss =
      //       b.map((dynamic item) => News.fromJson(item)).toList();
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
