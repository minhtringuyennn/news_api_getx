import 'package:news_api_getx/core/model/article.dart';

abstract class NewsRepo {
  Future<List<Article>> getNewsHeadline();
  Future<List<Article>> getSearchedNews(String query);
}
