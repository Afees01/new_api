import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_api/models/news_screen_model.dart';

class NewsScreenController with ChangeNotifier {
  List<Article> articleList = [];

  Future<void> getnewsapi() async {
    final url = Uri.parse(
        "https://www.wired.com/story/unmasking-bitcoin-creator-satoshi-nakamoto-again/");
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Newsapi newsApiobj = newsapiFromJson(response.body);
        articleList = newsApiobj.articles ?? [];
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
