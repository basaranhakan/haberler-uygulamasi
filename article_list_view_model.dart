import 'package:flutter/foundation.dart';
import 'package:haberuygulamasi/services/news_service.dart';
import 'package:haberuygulamasi/viewmodel/article_view_model.dart';

import '../models/articles.dart';

enum Status { initial, loding, loaded }

class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel("general", []);
  Status status = Status.initial;
  ArticleListViewModel() {
    getNews("general  ");
  }

  get articles => null;
  Future<void> getNews(String category) async {
    status = Status.loding;
    notifyListeners();
    List<Articles> articles = await NewsServise().fetchNews(category);
    status = Status.loaded;
    notifyListeners();
  }
}
