import 'dart:convert';
import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_apppp/database/data_model.dart';
import 'package:news_apppp/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final Dio _dio = Dio();

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final List<News> _fetchedInfo = [];
  List<News> get fetchedInfo => _fetchedInfo;

  List<NewsDataModel> _fetchedNews = [];
  List<NewsDataModel> get fetchedNews => _fetchedNews;

  getNewsFromApi() async {
    _isLoading = true;
    http.Response newsInfo = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-01-07&to=2023-01-07&sortBy=popularity&apiKey=8207e18b9fc34d4ba4cfe769384981e5"));
    if (newsInfo.statusCode == 200) {
      try {
        var a = jsonDecode(newsInfo.body);
        List b = a['articles'];

        // _fetchedInfo = b.map((dynamic item) => News.fromMap(item)).toList();
        for (var element in b) {
          News news = News.fromMap(element);
          NewsDataModel newsDataModel = NewsDataModel(
              title: news.title,
              urlToImage: news.urlToImage,
              description: news.description,
              content: news.description,
              source: news.source);
          saveNewsinDb(newsDataModel);
          _fetchedNews.add(newsDataModel);
        }
        getNewsFromDb();
        _isLoading = false;
        SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
          notifyListeners();
        });
      } catch (e) {
        log(e.toString());
      }
    }
  }

  saveNewsinDb(NewsDataModel news) async {
    Box<NewsDataModel> box = await Hive.openBox<NewsDataModel>('news');
    box.add(news);
  }

  getNewsFromDb() async {
    log("came to db");
    Box<NewsDataModel> box = await Hive.openBox<NewsDataModel>('news');
    _fetchedNews = box.values.toList();
    log(_fetchedInfo.length.toString());
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
