import 'dart:convert';
import 'dart:developer';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_apppp/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  final Dio _dio = Dio();

  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<News> _fetchedInfo = [];
  List<News> get fetchedInfo => _fetchedInfo;

  getNewsFromApi() async {
    _isLoading = true;
    http.Response newsInfo = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-01-07&to=2023-01-07&sortBy=popularity&apiKey=8207e18b9fc34d4ba4cfe769384981e5"));
    if (newsInfo.statusCode == 200) {
      try {
        var a = jsonDecode(newsInfo.body);
        List b = a['articles'];

        _fetchedInfo = b.map((dynamic item) => News.fromMap(item)).toList();
        _isLoading = false;
        SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
          notifyListeners();
        });
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
